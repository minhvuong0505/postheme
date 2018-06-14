<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require_once("Secure_Controller.php");

class Client extends Secure_Controller{

	public function __construct(){
		parent::__construct();

		$this->load->library('sale_lib');
		$this->load->library('email_lib');
		$this->load->library('token_lib');
	}

	public function index(){

		$data['cart'] = $this->sale_lib->get_cart();

		$totals = $this->sale_lib->get_totals();
		$data['item_count'] = $totals['item_count'];
		$data['total_units'] = $totals['total_units'];
		$data['subtotal'] = $totals['subtotal'];
		$data['total'] = $totals['total'];
		$data['payments_total'] = $totals['payment_total'];
		$data['cash_rounding'] = $this->session->userdata('cash_rounding');
		if($data['cash_rounding']){
			$data['total'] = $totals['cash_total'];
			$data['amount_due'] = $totals['cash_amount_due'];
		}else{
			$data['total'] = $totals['total'];
			$data['amount_due'] = $totals['amount_due'];
		}

		$this->load->view('client/manage', $data);

	}
	public function cart(){
		$totals = $this->sale_lib->get_totals();
		$data['item_count'] = $totals['item_count'];
		$data['total_units'] = $totals['total_units'];
		$data['subtotal'] = $totals['subtotal'];
		$data['total'] = $totals['total'];
		$data['payments_total'] = $totals['payment_total'];
		$data['cash_rounding'] = $this->session->userdata('cash_rounding');
		if($data['cash_rounding']){
			$data['total'] = $totals['cash_total'];
			$data['amount_due'] = $totals['cash_amount_due'];
		}else{
			$data['total'] = $totals['total'];
			$data['amount_due'] = $totals['amount_due'];
		}
		$data['cart'] = $this->sale_lib->get_cart();
		echo json_encode($data);
	}
}