<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title><?php echo $this->lang->line('items_generate_barcodes'); ?></title>
	<link rel="stylesheet" rev="stylesheet" href="<?php echo base_url();?>css/barcode_font.css" />
	<style type="text/css" media="print">
		#print_button{
		display:none;
		}
	</style>

	<script type="text/javascript">
		/*function func_cookie(){
			document.cookie = "quality = "+document.getElementById('quality').value;
		}*/
		window.onload = function printpage(){
			var html = '';
			html += " <?php foreach($items as $item){
				for($i = 1; $i <= 20;$i+=2){
					if($i < 20){
						echo '</tr><td>' . $this->barcode_lib->display_barcode($item, $barcode_config) . '</td>';
						echo '<td>' . $this->barcode_lib->display_barcode($item, $barcode_config) . '</td></tr>';			
					}else{
						echo '</tr><td>' . $this->barcode_lib->display_barcode($item, $barcode_config) . '</td></tr>';
				} 
			}}?> ";

				document.getElementById("barcode").innerHTML = html;
				window.print();
			}
		//}
	</script>
</head>

<body class=<?php echo "font_".$this->barcode_lib->get_font_name($barcode_config['barcode_font']); ?> 
      style="font-size:<?php echo $barcode_config['barcode_font_size']; ?>px">
      	<input type="button" id="print_button"  href="javascript:void(0)" value="Print" onclick="printpage()" />
	<table  id ="barcode"  cellspacing=<?php echo $barcode_config['barcode_page_cellspacing']; ?> width='<?php echo $barcode_config['barcode_page_width']."%"; ?>' >

		 <tr >
			<?php
		
			foreach($items as $item)
			{
				//if ($count % $barcode_config['barcode_num_in_row'] == 0 and $count != 0)
				//{
				//	echo '</tr><tr>';
			    //}
			    echo '<td>' . $this->barcode_lib->display_barcode($item, $barcode_config) . '</td>';
				
				
			}
			?>
		</tr>
	</table>
	

	
</body>

</html>