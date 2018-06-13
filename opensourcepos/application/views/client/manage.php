<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<base href="<?php echo base_url();?>" />
	<title><?php echo $this->config->item('company') . ' | ' . $this->lang->line('common_powered_by') . ' OSPOS ' . $this->config->item('application_version') ?></title>
	<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
	<link rel="stylesheet" type="text/css" href="<?php echo 'dist/bootswatch/' . (empty($this->config->item('theme')) ? 'flatly' : $this->config->item('theme')) . '/bootstrap.min.css' ?>"/>

	<?php if ($this->input->cookie('debug') == 'true' || $this->input->get('debug') == 'true') : ?>
		<!-- bower:css -->
		<link rel="stylesheet" href="bower_components/jquery-ui/themes/base/jquery-ui.css" />
		<link rel="stylesheet" href="bower_components/bootstrap3-dialog/dist/css/bootstrap-dialog.min.css" />
		<link rel="stylesheet" href="bower_components/jasny-bootstrap/dist/css/jasny-bootstrap.css" />
		<link rel="stylesheet" href="bower_components/smalot-bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />
		<link rel="stylesheet" href="bower_components/bootstrap-select/dist/css/bootstrap-select.css" />
		<link rel="stylesheet" href="bower_components/bootstrap-table/src/bootstrap-table.css" />
		<link rel="stylesheet" href="bower_components/bootstrap-table/dist/extensions/sticky-header/bootstrap-table-sticky-header.css" />
		<link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css" />
		<link rel="stylesheet" href="bower_components/chartist/dist/chartist.min.css" />
		<link rel="stylesheet" href="bower_components/chartist-plugin-tooltip/dist/chartist-plugin-tooltip.css" />
		<link rel="stylesheet" href="bower_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.css" />
		<!-- endbower -->
		<!-- start css template tags -->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.autocomplete.css"/>
		<link rel="stylesheet" type="text/css" href="css/invoice.css"/>
		<link rel="stylesheet" type="text/css" href="css/ospos.css"/>
		<link rel="stylesheet" type="text/css" href="css/ospos_print.css"/>
		<link rel="stylesheet" type="text/css" href="css/popupbox.css"/>
		<link rel="stylesheet" type="text/css" href="css/receipt.css"/>
		<link rel="stylesheet" type="text/css" href="css/register.css"/>
		<link rel="stylesheet" type="text/css" href="css/reports.css"/>
		<!-- end css template tags -->
		<!-- bower:js -->
		<script src="bower_components/jquery/dist/jquery.js"></script>
		<script src="bower_components/jquery-form/src/jquery.form.js"></script>
		<script src="bower_components/jquery-validate/dist/jquery.validate.js"></script>
		<script src="bower_components/jquery-ui/jquery-ui.js"></script>
		<script src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
		<script src="bower_components/bootstrap3-dialog/dist/js/bootstrap-dialog.min.js"></script>
		<script src="bower_components/jasny-bootstrap/dist/js/jasny-bootstrap.js"></script>
		<script src="bower_components/smalot-bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
		<script src="bower_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
		<script src="bower_components/bootstrap-table/src/bootstrap-table.js"></script>
		<script src="bower_components/bootstrap-table/dist/extensions/export/bootstrap-table-export.js"></script>
		<script src="bower_components/bootstrap-table/dist/extensions/mobile/bootstrap-table-mobile.js"></script>
		<script src="bower_components/bootstrap-table/dist/extensions/sticky-header/bootstrap-table-sticky-header.js"></script>
		<script src="bower_components/moment/moment.js"></script>
		<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
		<script src="bower_components/file-saver.js/FileSaver.js"></script>
		<script src="bower_components/html2canvas/build/html2canvas.js"></script>
		<script src="bower_components/jspdf/dist/jspdf.min.js"></script>
		<script src="bower_components/jspdf-autotable/dist/jspdf.plugin.autotable.js"></script>
		<script src="bower_components/tableExport.jquery.plugin/tableExport.min.js"></script>
		<script src="bower_components/chartist/dist/chartist.min.js"></script>
		<script src="bower_components/chartist-plugin-axistitle/dist/chartist-plugin-axistitle.min.js"></script>
		<script src="bower_components/chartist-plugin-pointlabels/dist/chartist-plugin-pointlabels.min.js"></script>
		<script src="bower_components/chartist-plugin-tooltip/dist/chartist-plugin-tooltip.min.js"></script>
		<script src="bower_components/chartist-plugin-barlabels/dist/chartist-plugin-barlabels.min.js"></script>
		<script src="bower_components/remarkable-bootstrap-notify/bootstrap-notify.js"></script>
		<script src="bower_components/js-cookie/src/js.cookie.js"></script>
		<script src="bower_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.js"></script>
		<!-- endbower -->
		<!-- start js template tags -->
		<script type="text/javascript" src="js/imgpreview.full.jquery.js"></script>
		<script type="text/javascript" src="js/manage_tables.js"></script>
		<script type="text/javascript" src="js/nominatim.autocomplete.js"></script>
		<!-- end js template tags -->
	<?php else : ?>
		<!--[if lte IE 8]>
		<link rel="stylesheet" media="print" href="dist/print.css" type="text/css" />
		<![endif]-->
		<!-- start mincss template tags -->
		<link rel="stylesheet" type="text/css" href="dist/jquery-ui/jquery-ui.min.css"/>
		<link rel="stylesheet" type="text/css" href="dist/opensourcepos.min.css?rel=84371241b2"/>
		<!-- end mincss template tags -->
		<!-- start minjs template tags -->
		<script type="text/javascript" src="dist/opensourcepos.min.js?rel=6f405d80cf"></script>
		<script type="text/javascript" src="dist/main.min.js?rel=6f405d80cf"></script>
		<!-- end minjs template tags -->
	<?php endif; ?>

	<?php $this->load->view('partial/header_js'); ?>
	<?php $this->load->view('partial/lang_lines'); ?>

	<style type="text/css">
		html {
			overflow: auto;
		}
	</style>
</head>

<body>
<div class="wrapper" style="width: 100% !important">
	<div class="topbar">
		<div class="container">
			<div class="navbar-left">
				<div id="liveclock"><?php echo date($this->config->item('dateformat') . ' ' . $this->config->item('timeformat')) ?></div>
			</div>
			
			<div class="navbar-center" style="text-align:center">
				<strong><?php echo $this->config->item('company'); ?></strong>
			</div>
		</div>
	</div>
	<div class="container" style='width:100%'>
		<div class="slogan">
			<div class="company-name">
				welcome to <?php echo $this->config->item('company'); ?>
			</div>
			<div class="company-service">
				you are being served by supervisor
			</div>
		</div>
	</div>
	<div class="container" style='width:100%; position: fixed;'>
		<div class="row">
			<div class="client-wapper">
				<input type="text" name="barcode" value="18" class="form-control input-sm" tabindex="2" style="display: none;">
				<table class="sales_table_100" id="register">
					<thead>
						<tr>
							<th style="width: 15%;"><?php echo $this->lang->line('sales_item_number'); ?></th>
							<th style="width: 35%;"><?php echo $this->lang->line('sales_item_name'); ?></th>
							<th style="width: 10%;"><?php echo $this->lang->line('sales_price'); ?></th>
							<th style="width: 10%;"><?php echo $this->lang->line('sales_quantity'); ?></th>
							<th style="width: 10%;"><?php echo $this->lang->line('sales_discount'); ?></th>
							<th style="width: 10%;"><?php echo $this->lang->line('sales_total'); ?></th>
						</tr>
					</thead>

					<tbody id="cart_contents">
					<?php foreach($cart as $key => $item){ ?>                                                                               
						<tr>
							<td><?php echo $item['item_number']; ?></td>
							<td style="align: center;"><?php echo $item['name']; ?>								
								<input type="hidden" name="location" value="1">
							</td>
							<td><?php echo $item['price']; ?></td>										
							<td><?php echo $item['quantity']; ?></td>
							<td><?php echo to_decimals($item['discount'],0).'%'; ?></td>
							<td><?php echo to_currency($item['discounted_total']); ?></td>
						</tr>
						<tr>							
							<td>&nbsp;</td>
							<td style="color: #2F4F4F;"></td>
							<td colspan="4" style="text-align: left;">								
								<input type="hidden" name="serialnumber" value="">
							</td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
			<div class="overall_sale" class="panel panel-default">
				<div class="panel-body">
					<table class="sales_table_100" id="sale_totals">
						<tbody>
							<tr>
								<th style="width: 55%;"><?php echo $this->lang->line('sales_quantity_of_items', $item_count); ?></th>
								<th style="width: 45%; text-align: right;"><?php echo $total_units; ?></th>
							</tr>
							<tr>
								<th style="width: 55%;"><?php echo $this->lang->line('sales_sub_total'); ?></th>
								<th style="width: 45%; text-align: right;"><?php echo to_currency($subtotal); ?></th>
							</tr>

							
							<tr>
								<th style='width: 55%;'><?php echo $this->lang->line('sales_total'); ?></th>
								<th style="width: 45%; text-align: right;"><span id="sale_total"><?php echo to_currency($total); ?></span></th>
							</tr>
						</tbody>
					</table>
					<table class="sales_table_100 payment_totals" id="payment_totals">
						<tbody>
							<tr>
								<th style="width: 55%;"><?php echo $this->lang->line('sales_payments_total');?></th>
								<th style="width: 45%; text-align: right;"><?php echo to_currency($payments_total); ?></th>
							</tr>
							<tr>
								<th style="width: 55%;"><?php echo $this->lang->line('sales_amount_due');?></th>
								<th style="width: 45%; text-align: right;"><span id="sale_amount_due"><?php echo to_currency($amount_due); ?></span></th>
							</tr>
						</tbody>
					</table>
				</div>		
			</div>
			<div class="payment" class="panel panel-default">
				<div class="panel-body">
					<div id="payment_details" style="border: none !important">
						<table class="sales_table_100" >
							<tbody>
								<tr>
									<td><?php echo $this->lang->line('sales_payment');?></td>
								</tr>
							</tbody>
						</table>				
					</div>
				</div>		
			</div>			
		</div>
		<div class="footer-client">
				
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		setInterval(function(){
			var html = '';
			var tbody = '';
			var tbody_2 = '';
		    	$.ajax({
		    		url: './client/cart',
		    	})
		    	.done(function(data) {
		    		var data = JSON.parse(data);
		    		$.each(data.cart,function(key,val){
		    			html += "<tr>"+
									"<td>"+val.item_number+"</td>"+
									"<td style='align: center;'>"+val.name+"</td>"+											
									"<td>"+val.price+"</td>"+										
									"<td>"+val.quantity+"</td>"+
									"<td>"+val.discount+" %</td>"+
									"<td>$"+val.discounted_total+"</td>"+
								"</tr><tr><td>&nbsp;</td><td style='color: #2F4F4F;'></td><td colspan='4' style='text-align: left;'><input type='hidden' name='serialnumber' value=''></td></tr>";
		    		})
		    		tbody += "<tbody>"+
							"<tr>"+
								"<th style='width: 55%;'><?php echo $this->lang->line('sales_quantity_of_items', $item_count); ?></th>"+
								"<th style='width: 45%; text-align: right;''>"+data.total_units+"</th>"+
							"</tr>"+
							"<tr>"+
								"<th style='width: 55%;'><?php echo $this->lang->line('sales_sub_total'); ?></th>"+
								"<th style='width: 45%; text-align: right;'>$"+data.subtotal+"</th>"+
							"</tr>"+
							"<tr>"+
								"<th style='width: 55%;'><?php echo $this->lang->line('sales_total'); ?></th>"+
								"<th style='width: 45%; text-align: right;'><span id='sale_total'>$"+data.total+"</span></th>"+
							"</tr>"+
						"</tbody>";
					tbody_2 += "<tbody>"+
							"<tr>"+
								"<th style='width: 55%;'><?php echo $this->lang->line('sales_payments_total');?></th>"+
								"<th style='width: 45%; text-align: right;''>$"+data.payments_total+"</th>"+
							"</tr>"+
							"<tr>"+
								"<th style='width: 55%;'><?php echo $this->lang->line('sales_amount_due');?></th>"+
								"<th style='width: 45%; text-align: right;'><span id='sale_amount_due'>$"+data.amount_due+"</span></th>"+
							"</tr>"+
						"</tbody>";
		    		$('#cart_contents').html(html);
		    		$('#sale_totals').html(tbody);
		    		$('.payment_totals').html(tbody_2);

		    	})
		    	.fail(function() {
		    		console.log("error");
		    	})
		    }, 1000);
	})
		/*var test = "<?php echo $item_count; ?>";
		if(test > 0)
			setInterval(location.reload(),3000);
		else{
			setInterval(location.reload(),10000);
		}		
	})*
	if (typeof(EventSource) !== "undefined") {
	   	var notification = new EventSource('server.php');
	   	notification.onmessage = function (event) {
			//var data = JSON.parse(event.data);
	   		console.log(event.data);
	   	}
	} else {
	   (function poll(){
	    setTimeout(function(){
	        $.ajax({ url: "/notification/get_notification", success: function(data){ 
	        //doing something
	        poll();
	        }, dataType: "json"});
	    }, 3000);
	    })();
	    console.log(abc);*/
		    
</script>
</body>
</html>