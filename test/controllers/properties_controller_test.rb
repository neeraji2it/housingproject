require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post :create, property: { area: @property.area, borewell_status: @property.borewell_status, boundary_status: @property.boundary_status, city: @property.city, contact_count: @property.contact_count, description: @property.description, drainage_status: @property.drainage_status, electricity_type: @property.electricity_type, email: @property.email, inleave_rode: @property.inleave_rode, land_status: @property.land_status, lattitude: @property.lattitude, location: @property.location, longitude: @property.longitude, mobile: @property.mobile, name: @property.name, person_type: @property.person_type, present_land_status: @property.present_land_status, price: @property.price, rate: @property.rate, shed_status: @property.shed_status, title: @property.title, type_of_land: @property.type_of_land, view_count: @property.view_count }
    end

    assert_redirected_to property_path(assigns(:property))
  end

  test "should show property" do
    get :show, id: @property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property
    assert_response :success
  end

  test "should update property" do
    patch :update, id: @property, property: { area: @property.area, borewell_status: @property.borewell_status, boundary_status: @property.boundary_status, city: @property.city, contact_count: @property.contact_count, description: @property.description, drainage_status: @property.drainage_status, electricity_type: @property.electricity_type, email: @property.email, inleave_rode: @property.inleave_rode, land_status: @property.land_status, lattitude: @property.lattitude, location: @property.location, longitude: @property.longitude, mobile: @property.mobile, name: @property.name, person_type: @property.person_type, present_land_status: @property.present_land_status, price: @property.price, rate: @property.rate, shed_status: @property.shed_status, title: @property.title, type_of_land: @property.type_of_land, view_count: @property.view_count }
    assert_redirected_to property_path(assigns(:property))
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete :destroy, id: @property
    end

    assert_redirected_to properties_path
  end
end
