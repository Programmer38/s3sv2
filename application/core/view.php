<?
class View
{

	function generate($content_view, $template_view, $data = null,$equipments = null)
	{


		include 'application/views/'.$template_view;
	}
}