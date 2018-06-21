
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
	<div class="wrapper">
		<div class="topbar">
			<div class="container">
				<div class="navbar-left">
					<div id="liveclock"><?php echo date($this->config->item('dateformat') . ' ' . $this->config->item('timeformat')) ?></div>
				</div>

				<div class="navbar-right" style="margin:0">
					<?php echo anchor('home/change_password/'.$user_info->person_id, $user_info->first_name . ' ' . $user_info->last_name, array('class' => 'modal-dlg', 'data-btn-submit' => $this->lang->line('common_submit'), 'title' => $this->lang->line('employees_change_password'))); ?>
					<?php echo '  |  ' . ($this->input->get('debug') == 'true' ? $this->session->userdata('session_sha1') . '  |  ' : ''); ?>
					<?php echo anchor('home/logout', $this->lang->line('common_logout')); ?>
				</div>

				<div class="navbar-center" style="text-align:center">
					<strong><?php echo $this->config->item('company'); ?></strong>
				</div>
			</div>
		</div>

		<div class="container" style='width:100%'>
			<div class="row content">
				<div class='col-sm-4 menu'>
					<div class="navbar navbar-default" role="navigation">
						<div class="category">
							<div class="collapse navbar-collapse" id="navbarText">
							    <ul class="navbar-nav mr-auto">
							    	<?php foreach(json_decode($category) as $key){ ?>
							   		<li class="nav-item">
							        	<a class="nav-link" href="javascript:get_item('<?php echo $key->category; ?>')"><?php echo $key->category; ?></a>
							    	</li>
							    	<?php } ?>
								</ul>
							</div>
						</div>
						<!-- body has the class "cbp-spmenu-push" -->
				<div id='navigation'>
						<?php foreach(json_decode($items) as $key){?>
							<div class="col-md-4 col-sm-6 col-xs-6 pro-loop">
								<div class="product-block product-resize fixheight">
									<div class="product-img image-resize view view-third">
										<a href="javascript:submit_form(<?php echo $key->item_number; ?>)" title="Jumpsuit In Họa Tiết 5243">
											<img class="first-image  has-img" alt=" Jumpsuit In Họa Tiết 5243 " src="../public/uploads/item_pics/<?php echo $key->pic_filename; ?>">
										</a>
									</div>
									<div class="product-detail clearfix">
										<!-- <p class="pro-vendor"><a href="vendors?q=147"><?php echo $key->item_number; ?></a></p> -->
										<!-- sử dụng pull-left -->
										<h3 class="pro-name"><a href="javascript:submit_form(<?php echo $key->item_number; ?>)" title="<?php echo $key->item_number; ?>"><?php echo $key->name; ?></a></h3>
										<div class="pro-prices">
											<?php if($key->promotion_day_start <= strtotime(date('m/d/Y')) && strtotime(date('m/d/Y')) <= $key->promotion_day_end){ ?>
												<span class="pro-price" ><del style="color: #e81e1e"><?php echo to_currency($key->unit_price); ?></del></span> &nbsp
												<span class="pro-price"><?php echo to_currency($key->promotion_price); ?></span>
											<?php }else{ ?>	
												<p class="pro-price"><?php echo to_currency($key->unit_price); ?></p>
											<?php } ?>
											<p class="pro-price-del text-left"></p>
										</div>
									</div>
								</div>	
							</div>
						<?php } ?>
						</div>
						<div  style="text-align: center; margin-top: 650px;">
							<ul class="pagination">
								<li class="active"><a style="cursor: pointer;" href="javascript:func_get_item(1)">1</a></li>
								<?php for($i = 2; $i <= $Total; $i++){ ?>
							    <li><a style="cursor: pointer;" href="javascript:func_get_item(<?php echo $i; ?>)"><?php echo $i; ?></a></li>
							    <?php } ?>
						  	</ul>
						</div>
					</div>
				</div>
				<div class='col-sm-8' >
