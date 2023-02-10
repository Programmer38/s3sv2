<?
use config\connection;
require_once $_SERVER["DOCUMENT_ROOT"] . '/vendor/autoload.php';

class Model_Main extends Model
{
	protected $db;
	public function __construct(){
		$this->view = new View();
		$this->db =  new mysqli(connection::$server, connection::$user, connection::$password, connection::$db);
	}

	public function get_params(){
		$result['select_internal'] = $this->db->query("SELECT * FROM `internal_colors`")->fetch_all(MYSQLI_ASSOC);
		$result['select_outer'] = $this->db->query("SELECT * FROM `outer_colors`")->fetch_all(MYSQLI_ASSOC);
		$result['select_door_knob'] = $this->db->query("SELECT * FROM `door_knob_colors`")->fetch_all(MYSQLI_ASSOC);
		$result['select_width'] = $this->db->query("SELECT * FROM `width_params`")->fetch_all(MYSQLI_ASSOC);
		$result['select_height'] = $this->db->query("SELECT * FROM `height_params`")->fetch_all(MYSQLI_ASSOC);
		$result['select_direction'] = $this->db->query("SELECT * FROM `door_direction`")->fetch_all(MYSQLI_ASSOC);
		$result['select_accessories'] = $this->db->query("SELECT * FROM `accessories`")->fetch_all(MYSQLI_ASSOC);

		return $result;
	}

	public function get_equipment(){
		$result = $this->db->query('SELECT
 		internal_colors.id AS "internal_coating_id",
        outer_colors.id AS "outer_coating_id",
        door_knob_colors.id AS "door_knob_id",
        width_params.id AS "width_id",
        height_params.id AS "height_id",
        door_direction.id AS "door_direction_id",
        GROUP_CONCAT(accessories.id SEPARATOR ";") AS "accessories",
		  door.create_date,
        door.price AS "price"
FROM
 internal_colors JOIN
        outer_colors JOIN
        door_knob_colors JOIN
        width_params JOIN
        height_params JOIN
        door_direction JOIN
        accessories JOIN
        accessories_cross JOIN
        door
WHERE
 door.internal_coating_id = internal_colors.id AND
        door.outer_coating_id = outer_colors.id AND
        door.door_knob_id = door_knob_colors.id AND
        door.width_id = width_params.id AND
        door.height_id = height_params.id AND
        door.door_direction_id = door_direction.id AND
        door.id = accessories_cross.accessory_cross_id AND
        accessories_cross.accessory_id = accessories.id

GROUP BY door.id
ORDER BY door.id')->fetch_all(MYSQLI_ASSOC);
		return $result;
	}

	public function set_pdf($zakaz_id){
		$pdf_data = $this->db->query('SELECT
internal_colors.value AS "internal",
        outer_colors.value AS "outer",
        door_knob_colors.value AS "door_knob",
        width_params.value AS "width",
        height_params.value AS "height",
        door_direction.value AS "direction",
        GROUP_CONCAT(accessories.value SEPARATOR ";") AS "accessories",
		  door.create_date,
        door.price AS "price"
FROM
 internal_colors JOIN
        outer_colors JOIN
        door_knob_colors JOIN
        width_params JOIN
        height_params JOIN
        door_direction JOIN
        accessories JOIN
        accessories_cross JOIN
        door
WHERE
			door.id = '.$zakaz_id.' AND
 			door.internal_coating_id = internal_colors.id AND
        door.outer_coating_id = outer_colors.id AND
        door.door_knob_id = door_knob_colors.id AND
        door.width_id = width_params.id AND
        door.height_id = height_params.id AND
        door.door_direction_id = door_direction.id AND
        door.id = accessories_cross.accessory_cross_id AND
        accessories_cross.accessory_id = accessories.id

GROUP BY door.id
ORDER BY door.id')->fetch_assoc();

		ob_clean();
		$text = "<h1>Комплектация двери</h1>";
		$text .= "<p>Цвет покраски: ".$pdf_data['internal']."</p>";
		$text .= "<p>Цвет пленки: ".$pdf_data['outer']."</p>";
		$text .= "<p>Цвет ручки: ".$pdf_data['door_knob']."</p>";
		$text .= "<p>Ширина: ".$pdf_data['width']."</p>";
		$text .= "<p>Высота: ".$pdf_data['height']."</p>";
		$text .= "<p>Открывание: ".$pdf_data['direction']."</p>";
		$text .= "<p>Аксессуары: ".$pdf_data['accessories']."</p>";
		$text .= "<p>Цена: ".$pdf_data['price']."</p>";
		$text .= "<p>Дата заявки: ".$pdf_data['create_date']."</p>";
		$mpdf = new \Mpdf\Mpdf();
		$mpdf->WriteHTML($text);
		$name_file = "".$_SERVER["DOCUMENT_ROOT"]."/temp/".date("m-d-y-H-i-s").".pdf";
		$mpdf->Output($name_file, 'F');
		return $name_file;
	}

	public function setthmessage($data){
		$tgquery = $this->db->query("SELECT * FROM `configurations`")->fetch_assoc();
		$chat = $tgquery['chat_id'];
		$message = "Комплектация:";
		$token = $tgquery['token'];

		$arrayQuery = array(
    		'chat_id' => $chat,
    		'caption' => 'Комплектация:',
   	 	'document' => curl_file_create($data, 'application/pdf' , 'pdf.pdf')
		);
		$ch = curl_init('https://api.telegram.org/bot'. $token .'/sendDocument');
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $arrayQuery);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_HEADER, false);
		$res = curl_exec($ch);
		curl_close($ch);

		return true;
	}
	public function insert_form($data){
		$accessories = $data['select_accessories'];
		$query = $this->db->query("INSERT INTO `door`(`internal_coating_id`,`outer_coating_id`,`door_knob_id`,`width_id`,`height_id`,`door_direction_id`,`price`) VALUES ('".$data['select_internal']."','".$data['select_outer']."','".$data['select_door_knob']."','".$data['select_width']."','".$data['select_height']."','".$data['select_direction']."','".$data['price']."');");

		$door_id = $this->db->insert_id;

		foreach ($accessories as $value) {
			$query = $this->db->query("INSERT INTO `accessories_cross`(`accessory_cross_id`,`accessory_id`) VALUES ('".$door_id."','".$value."');");
			//
		}

		$result = $door_id;

		return $result;
	}



}