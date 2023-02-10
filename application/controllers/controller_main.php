<?

class Controller_Main extends Controller
{

	function __construct()
	{
		$this->model = new Model_Main();
		$this->view = new View();
	}

	function action_index()
	{
		$data = $this->model->get_params();
		$equipment = $this->model->get_equipment();//запрос уже готовых комплектаций
		$this->view->generate('main_view.php', 'template_view.php', $data,$equipment);

		if(isset($_POST['select_internal']) && isset($_POST['select_outer']) && isset($_POST['select_door_knob']) && isset($_POST['select_width']) && isset($_POST['select_height']) && isset($_POST['select_direction'])){
			$form_data['select_internal'] = $_POST['select_internal'];
			$form_data['select_outer'] = $_POST['select_outer'];
			$form_data['select_door_knob'] = $_POST['select_door_knob'];
			$form_data['select_width'] = $_POST['select_width'];
			$form_data['select_height'] = $_POST['select_height'];
			$form_data['select_direction'] = $_POST['select_direction'];
			$form_data['select_accessories'] = $_POST['select_accessories'];

			$form_data['price'] = $_POST['price'];
			$insert_form = $this->model->insert_form($form_data);

			//pdf

			$set_pdf = $this->model->set_pdf($insert_form);
			$set_tgmessage = $this->model->setthmessage($set_pdf);
			if($set_tgmessage == true){
				echo "<script>alert('Комплектация сохранена и отправлена на tg!');window.location.href='/';</script>";
			}

		}
	}

}