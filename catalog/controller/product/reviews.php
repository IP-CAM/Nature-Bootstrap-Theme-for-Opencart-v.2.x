<?php
class ControllerProductReviews extends Controller {
	public function index() {
		$this->load->language('product/reviews');

		$this->load->model('catalog/product');
		$this->load->model('catalog/review');
		$this->load->model('tool/image');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		
		$data['products'] = array();
		
		$data['reviews'] = array();
		
		$products = $this->model_catalog_product->getProducts();

		foreach ($products as $product_id) {
			
			$data['products'][] = array(
				'product_id' => $product_id['product_id'],
				'name' => $product_id['name'],
				'description' => html_entity_decode($product_id['description'], ENT_QUOTES, 'UTF-8'),
				'short_description' => mb_substr(strip_tags(html_entity_decode($product_id['description'], ENT_QUOTES, 'UTF-8')), 0, 500) . '...',
				'reviews' => $product_id['reviews'],
				'rating' => $product_id['rating'],
				'image' => $product_id['image'],
				'href' => $this->url->link('product/product', 'product_id=' .  $product_id['product_id'])
			);
			
			$reviews = $this->model_catalog_review->getReviewsByProductId($product_id['product_id']);
			
			$image = $this->model_tool_image->resize($product_id['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
			
			foreach ($reviews as $review) {
					$data['reviews'][] = array(
						'review_id'  => $review['review_id'],
						'product' => array(
							'product_id' => $product_id['product_id'],
							'name' => $product_id['name'],
							'href' => $this->url->link('product/product', 'product_id=' .  $product_id['product_id']),
							'image' => $image,
							'rating' => $product_id['rating']
						),
						'author' 	 => $review['author'],
						'text'	 	 => $review['text'],
						'date_added' => $review['date_added'],
						'rating'	 => $review['rating'],
					);
			}
		}
		usort($data['reviews'], array('ControllerProductReviews','cmp'));

			$this->document->setTitle($this->language->get('meta_title'));
			$this->document->setDescription($this->language->get('meta_description'));
			$this->document->setKeywords($this->language->get('meta_keyword'));

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('product/reviews')
			);

			$data['heading_title'] = $this->language->get('heading_title');
			$data['write_review'] = $this->language->get('write_review');
			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/reviews.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/reviews.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/product/reviews.tpl', $data));
			}
		
	}
	
	function cmp($a, $b) { 
		if (strtotime($a['date_added']) == strtotime($b['date_added'])) { 
			return 0; 
		} 
		return (strtotime($a['date_added']) > strtotime($b['date_added'])) ? -1 : 1; 
	} 
}