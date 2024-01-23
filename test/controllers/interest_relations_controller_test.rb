require "test_helper"

class InterestRelationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interest_relation = interest_relations(:one)
  end

  test "should get index" do
    get interest_relations_url, as: :json
    assert_response :success
  end

  test "should create interest_relation" do
    assert_difference("InterestRelation.count") do
      post interest_relations_url, params: { interest_relation: { user_id: @interest_relation.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show interest_relation" do
    get interest_relation_url(@interest_relation), as: :json
    assert_response :success
  end

  test "should update interest_relation" do
    patch interest_relation_url(@interest_relation), params: { interest_relation: { user_id: @interest_relation.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy interest_relation" do
    assert_difference("InterestRelation.count", -1) do
      delete interest_relation_url(@interest_relation), as: :json
    end

    assert_response :no_content
  end
end
