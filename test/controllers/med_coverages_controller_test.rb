require 'test_helper'

class MedCoveragesControllerTest < ActionController::TestCase
  setup do
    @med_coverage = med_coverages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:med_coverages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create med_coverage" do
    assert_difference('MedCoverage.count') do
      post :create, med_coverage: { carrier: @med_coverage.carrier, co_ins_percent: @med_coverage.co_ins_percent, er_fee: @med_coverage.er_fee, in_net_deduct_fam: @med_coverage.in_net_deduct_fam, in_net_deduct_ind: @med_coverage.in_net_deduct_ind, network_type: @med_coverage.network_type, out_net_deduct_fam: @med_coverage.out_net_deduct_fam, out_net_deduct_ind: @med_coverage.out_net_deduct_ind, out_of_pocket_max: @med_coverage.out_of_pocket_max, pcp_fee: @med_coverage.pcp_fee, plan_level: @med_coverage.plan_level, renewal_date: @med_coverage.renewal_date, rx_brand_fee: @med_coverage.rx_brand_fee, rx_generic_fee: @med_coverage.rx_generic_fee, specialist_fee: @med_coverage.specialist_fee, user_id: @med_coverage.user_id }
    end

    assert_redirected_to med_coverage_path(assigns(:med_coverage))
  end

  test "should show med_coverage" do
    get :show, id: @med_coverage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @med_coverage
    assert_response :success
  end

  test "should update med_coverage" do
    patch :update, id: @med_coverage, med_coverage: { carrier: @med_coverage.carrier, co_ins_percent: @med_coverage.co_ins_percent, er_fee: @med_coverage.er_fee, in_net_deduct_fam: @med_coverage.in_net_deduct_fam, in_net_deduct_ind: @med_coverage.in_net_deduct_ind, network_type: @med_coverage.network_type, out_net_deduct_fam: @med_coverage.out_net_deduct_fam, out_net_deduct_ind: @med_coverage.out_net_deduct_ind, out_of_pocket_max: @med_coverage.out_of_pocket_max, pcp_fee: @med_coverage.pcp_fee, plan_level: @med_coverage.plan_level, renewal_date: @med_coverage.renewal_date, rx_brand_fee: @med_coverage.rx_brand_fee, rx_generic_fee: @med_coverage.rx_generic_fee, specialist_fee: @med_coverage.specialist_fee, user_id: @med_coverage.user_id }
    assert_redirected_to med_coverage_path(assigns(:med_coverage))
  end

  test "should destroy med_coverage" do
    assert_difference('MedCoverage.count', -1) do
      delete :destroy, id: @med_coverage
    end

    assert_redirected_to med_coverages_path
  end
end
