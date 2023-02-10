<h1>Конструктор</h1>
<section>
	<div class="container">
		<div class="row">
		<div class="col-xs-12 col-md-8 visual">
			<div class="dveri">
				<div class="item left"><div class="pokraska"><div class="plenka"><div class="ruchka">&nbsp;</div></div></div></div>
				<div class="item right"><div class="pokraska"><div class="plenka"><div class="ruchka">&nbsp;</div></div></div></div>
			</div>
			<div class="title">
				<div class="item">Вид снаружи</div>
				<div class="item">Вид изнутри</div>
			</div>
		</div>
		<div class="col-xs-12 col-md-4 forms">
			<div class="complect">
				<select class="form-select" id="select_complect">
					<option value="-">Готовые комплектации</option>
					<?
					foreach ($equipments as $value) {
						echo "<option data_foil='".$value['outer_coating_id']."' data_painting='".$value['internal_coating_id']."' data_door_hundle='".$value['door_knob_id']."' data_width='".$value['width_id']."' data_height='".$value['height_id']."'  data_opening='".$value['door_direction_id']."' data_accessories='".$value['accessories']."'>".$value['create_date']."</option>";
					}
					?>
				</select>
			</div>
			<form action="" method="POST" enctype="multipart/form-data">
				<?

				foreach ($data as $key=>$row) {
					switch ($key) {
						case "select_internal":
							$label = "Цвет покраски";
							break;
						case "select_outer":
							$label = "Цвет пленки";
							break;
						case "select_door_knob":
							$label = "Цвет ручки";
							break;
						case "select_width":
							$label = "Ширина";
							break;
						case "select_height":
							$label = "Высота";
							break;
						case "select_direction":
							$label = "Открывание";
							break;
						case "select_accessories":
							$label = "Аксеcсуары";
							break;
					}
					?>
					<div class="item">
						<label for="<?echo $key?>"><?echo $label?></label>
						<?
						if($key == "select_accessories"){
							?>
							<select class="form-select" multiple aria-label="multiple select" name="<?echo $key?>[]" id="<?echo $key?>">
								<option value="0" data_price="0">-</option>
								<?
								foreach ($row as $option){
									?>
									<option value="<?echo $option['id']?>" data_price="<?echo $option['price']?>"><?echo $option['value']?></option>
									<?
								}
								?>
							</select>
							<?
						}
						else{
							?>
							<select class="form-select" name="<?echo $key?>" id="<?echo $key?>">
								<option value="0" data_price="0">-</option>
								<?
								foreach ($row as $option){
									if(!$option['price']){
										$option['price'] = 0;
									}
									?>
									<option value="<?echo $option['id']?>" data_price="<?echo $option['price']?>"><?echo $option['value']?></option>
									<?
								}
								?>
							</select>
							<?
						}
						?>
					</div>
					<?
				}
				?>
				<div class="prices">
					<p>Цена: <span class="price">0</span>руб</p>
				</div>


				<input type="hidden" name="price" value="0">

				<div class="buttons"><button name="btn" class="btn btn-warning" id="btn_form">Отправить комплектацию</button></div>
			</form>
		</div>

<?php

?>
		</div>
	</div>
</section>