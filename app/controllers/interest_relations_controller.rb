class InterestRelationsController < ApplicationController

  # GET /interest_relations
  def index
    @interest_relations = InterestRelation.all

    render json: @interest_relations
  end

  # /interest_relations/matches/:id
  def get_matches
    sent_interest = InterestRelation.where(sender_id: params[:id])
    received_interest = InterestRelation.where(recipient_id: params[:id]).pluck(:sender_id)

    matches = sent_interest.where(recipient_id: received_interest)
    match_user_ids = matches.pluck(:sender_id, :recipient_id).flatten.uniq

    non_match_recipient_ids = sent_interest.pluck(:recipient_id) - match_user_ids
    match_user_ids = match_user_ids - [params[:id].to_i]

    no_match_users = User.where(id: non_match_recipient_ids).select(:id, :firstName, :lastName, :profileImageURL, :created_at)
    match_users = User.where(id: match_user_ids).select(:id, :firstName, :lastName, :profileImageURL, :phoneNo, :created_at)
    
    render json: { no_match_users: no_match_users, match_users: match_users }, status: :ok
  end

    # GET /interest_relations/:id
  def show
    @sent_interest = InterestRelation.where(sender_id: params[:id])
    render json: @sent_interest, status: :ok
  end

  # POST /interest_relations
  def create
    @interest_relation = InterestRelation.create!(interest_relation_params)

    render json: @interest_relation, status: :created, location: @interest_relation
  end

  # PATCH/PUT /interest_relations/1
  def update
    if @interest_relation.update(interest_relation_params)
      render json: @interest_relation
    else
      render json: @interest_relation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /interest_relations/1
  def destroy
    @interest_relation.destroy!
  end

  private

    # Only allow a list of trusted parameters through.
    def interest_relation_params
      params.require(:interest_relation).permit(:sender_id, :recipient_id)
    end
end
