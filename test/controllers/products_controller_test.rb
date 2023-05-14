require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
    test 'render a list of products' do
        get products_path
    
        assert_response :success
        assert_select '.product', 2
      end
    
      test 'render a detailed product page' do
        get product_path(products(:FIFA))
    
        assert_response :success
        assert_select '.title', 'FIFA 15'
        assert_select '.description', 'Videojuego de futbol año 2015'
        assert_select '.price', '20$'
      end

      test 'render a new product form' do
        get new_product_path
    
        assert_response :success
        assert_select 'form'
      end
end