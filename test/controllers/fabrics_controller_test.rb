require 'test_helper'

class FabricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fabric = fabrics(:one)
  end

  test "should get index" do
    get fabrics_url
    assert_response :success
  end

  test "should get new" do
    get new_fabric_url
    assert_response :success
  end

  test "should create fabric" do
    assert_difference('Fabric.count') do
      post fabrics_url, params: { fabric: { fabric_color: @fabric.fabric_color, fabric_composition: @fabric.fabric_composition, fabric_count: @fabric.fabric_count, fabric_id: @fabric.fabric_id, fabric_knitting_way: @fabric.fabric_knitting_way, fabric_price: @fabric.fabric_price, fabric_weight: @fabric.fabric_weight, fabric_yarn_count: @fabric.fabric_yarn_count } }
    end

    assert_redirected_to fabric_url(Fabric.last)
  end

  test "should show fabric" do
    get fabric_url(@fabric)
    assert_response :success
  end

  test "should get edit" do
    get edit_fabric_url(@fabric)
    assert_response :success
  end

  test "should update fabric" do
    patch fabric_url(@fabric), params: { fabric: { fabric_color: @fabric.fabric_color, fabric_composition: @fabric.fabric_composition, fabric_count: @fabric.fabric_count, fabric_id: @fabric.fabric_id, fabric_knitting_way: @fabric.fabric_knitting_way, fabric_price: @fabric.fabric_price, fabric_weight: @fabric.fabric_weight, fabric_yarn_count: @fabric.fabric_yarn_count } }
    assert_redirected_to fabric_url(@fabric)
  end

  test "should destroy fabric" do
    assert_difference('Fabric.count', -1) do
      delete fabric_url(@fabric)
    end

    assert_redirected_to fabrics_url
  end
end
