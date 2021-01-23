<?php  
class ControllerModuleFeedItems extends Controller {
	public function index($setting) {
		
		$this->load->language('module/feed_items');
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['read_more'] = $this->language->get('read_more');
		$data['text_views'] = $this->language->get('text_views');
		$data['text_reviews'] = $this->language->get('text_reviews');
		$data['text_price']	= $this->language->get('text_price');
		$data['text_all'] = $this->language->get('text_all');
		
		$this->load->model('catalog/product');
		$this->load->model('catalog/category');
		$this->load->model('catalog/review');
		
		$this->load->model('tool/image');
		
		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
		
		$data['categories'] = array();
		$data['products'] = array();
		
		$categories = $this->model_catalog_category->getCategories(0);
		
		foreach($categories as $category) {
			if($category['category_id'] != '59') {
			$filter_data = array(
				'filter_category_id' => $category['category_id'],
				'start' => 0,
				'limit' => 4
			);
				
			$products = $this->model_catalog_product->getProducts($filter_data);
			
			if (count($products) > 0) {
			
			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'],
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
			
			//$limit = 0;
			foreach ($products as $product) {
					
					//if($limit == 4) break;
					
					if ($product['image']) {
						$image = $this->model_tool_image->resize($product['image'], 200, 200);
						$image_big = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));

					} else {
						$image = $this->model_tool_image->resize('placeholder.png', 200, 200);
						$image_big = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$product['special']) {
						$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product['special'] ? $product['special'] : $product['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product['rating'];
					} else {
						$rating = false;
					}
						
					$reviews_total = $this->model_catalog_review->getTotalReviewsByProductId($product['product_id']);
					
					$data['products'][] = array(
						'product_id'  => $product['product_id'],
						'thumb'       => $image,
						//'image'       => $image_big,
						'name'        => $product['name'],
						//'description' => $this->shortDesc($product['description']),
						//'full_description' => strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')),
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product['product_id']),
						'category_id' => $category['category_id'],
						'reviews_total'	  => $reviews_total,
						'viewed_total'	  => $product['viewed'],
						'upc' => $product['upc']
					);	
					//$limit++;
			}		
			}
			
		}
		}
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/feed_items.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/feed_items.tpl', $data);
		} else {
			return $this->load->view('default/template/module/feed_items.tpl', $data);
		}
	}
	
	public function shortDesc($desc){
			$desc = strip_tags(html_entity_decode($desc, ENT_QUOTES, 'UTF-8'));
			$desc = substr($desc, 0, 210);
			$desc = rtrim($desc, "!,.-");
			$desc = substr($desc, 0, strrpos($desc, ' '));
			return $desc."...";
	}
}
?>