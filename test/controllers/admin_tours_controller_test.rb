require 'test_helper'

class AdminToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_tour = admin_tours(:one)
  end

  test "should get index" do
    get admin_tours_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_tour_url
    assert_response :success
  end

  test "should create admin_tour" do
    assert_difference('AdminTour.count') do
      post admin_tours_url, params: { admin_tour: { date_debut: @admin_tour.date_debut, date_fin: @admin_tour.date_fin } }
    end

    assert_redirected_to admin_tour_url(AdminTour.last)
  end

  test "should show admin_tour" do
    get admin_tour_url(@admin_tour)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_tour_url(@admin_tour)
    assert_response :success
  end

  test "should update admin_tour" do
    patch admin_tour_url(@admin_tour), params: { admin_tour: { date_debut: @admin_tour.date_debut, date_fin: @admin_tour.date_fin } }
    assert_redirected_to admin_tour_url(@admin_tour)
  end

  test "should destroy admin_tour" do
    assert_difference('AdminTour.count', -1) do
      delete admin_tour_url(@admin_tour)
    end

    assert_redirected_to admin_tours_url
  end
end
