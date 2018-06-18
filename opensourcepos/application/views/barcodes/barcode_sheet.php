<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title><?php echo $this->lang->line('items_generate_barcodes'); ?></title>
	<link rel="stylesheet" rev="stylesheet" href="<?php echo base_url();?>css/barcode_font.css" />
	<style type="text/css" media="print">
		#print_button, #quantity, #set{
		display:none;
		}
	</style>

	<script type="text/javascript">
		/*function func_cookie(){
			document.cookie = "quantity = "+document.getElementById('quantity').value;
		}*/

		function postStuff(){

			var d = new Date();
		    d.setTime(d.getTime() + (240*1000));
		    var expires = "expires="+ d.toUTCString();
			document.cookie = "IDss;" + expires + ";path=/";
			// Create our XMLHttpRequest object
			var hr = new XMLHttpRequest();
			// Create some variables we need to send to our PHP file
			var url = window.location.href;
			var result = "quantity=" + document.getElementById("quantity").value;
		
			
			hr.open("POST", url, true);
			hr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			// Access the onreadystatechange event for the XMLHttpRequest object
			hr.onreadystatechange = function() {
			

			    if(hr.readyState == 4 && hr.status == 200) {
			        var return_data = hr.responseText;
			        document.getElementById("status").innerHTML = return_data;
			    }
			}
			// Send the data to PHP now... and wait for response to update the status div
			hr.send(result); // Actually execute the request
			document.getElementById("status").innerHTML = "processing...";	

			/*var str = document.cookie;
				    var username = str.replace(/(?:(?:^|.*;\s*)SSL\s*\=\s*([^;]*).*$)|^.*$/, "$1"); */
				   
			     //   document.cookie = "IDss=NULL;"+ expires + ";path=/";        
			    
		}
		function printpage(){
				
				window.print();
			}
		//}
		function enter(event){
                if (event.keyCode == 13 || event.which == 13){
                    this.postStuff();
                   
                }
            };
        window.onload = function firstload(){
        	document.getElementById('quantity').value = 1;
			this.postStuff();
		}
		var noviProzor = window.resizeTo(640,600);
	</script>
</head>

<body class=<?php echo "font_".$this->barcode_lib->get_font_name($barcode_config['barcode_font']); ?> 
      style="font-size:<?php echo $barcode_config['barcode_font_size']; ?>px">
      	

      	<form id="status">
      		
           	<input type="text" id="quantity"   value="1"  onkeypress="javascript:enter(event);"/>   
           	<input type="button" id = "set" value="Set quantity" onclick="postStuff();"/>
           	<input type="button" id="print_button"  href="javascript:void(0)" value="Print" onclick="printpage()" />
           	<?php 	$quantity = (int)$_POST['quantity']; echo $quantity . ' barcodes'; ?>
        </form>
         
      
	<table  id ="barcode"  cellspacing=<?php echo $barcode_config['barcode_page_cellspacing']; ?> width='<?php echo $barcode_config['barcode_page_width']."%"; ?>' >

		 <tr >
			<?php
			$quantity = @(int)$_POST['quantity'];
			setcookie('IDss','',time()-60,"/");
			foreach($items as $item){
				for($i = 1; $i <= $quantity ;$i+=2){
					if($i < $quantity ){
						echo '</tr><td>' . $this->barcode_lib->display_barcode($item, $barcode_config) . '</td>';
						echo '<td>' . $this->barcode_lib->display_barcode($item, $barcode_config) . '</td></tr>';			
					}else{
						echo '</tr><td>' . $this->barcode_lib->display_barcode($item, $barcode_config) . '</td></tr>';
				} 
			}};
			?>
		</tr>
	</table>
	

	
</body>

</html>
