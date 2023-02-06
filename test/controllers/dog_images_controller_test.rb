require "test_helper"

class DogImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dog_images_index_url
    assert_response :success
  end

  test "should get show" do
    get dog_images_show_url
    assert_response :success
  end

  test "should get edit" do
    get dog_images_edit_url
    assert_response :success
  end
end
