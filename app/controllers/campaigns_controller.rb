class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns
  def index
    @pagy, @campaigns = pagy(Campaign.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @campaigns.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @campaigns.load
    @userpost = current_user.campaigns.all.select { |m| m.status == true || m.status == nil}
    @userposttrue = current_user.campaigns.all.select { |m| m.status == true}

  end

  # GET /campaigns/1
  def show
    @userposttrue = current_user.campaigns.all.select { |m| m.status == true}
    @userposttrues = current_user.campaigns.all.where (":status => 'true'")
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      @campaign.update(status: true) if acceptedpost?
      @campaign.update(status: false) if rejectedpost?
      redirect_to @campaign, notice: "Campaign was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campaigns/1
  def update
    @campaign.update(status: true) if acceptedpost?
      @campaign.update(status: false) if rejectedpost?

    if @campaign.update(campaign_params)
      redirect_to @campaign, notice: "Campaign was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign.destroy
    redirect_to campaigns_url, notice: "Campaign was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campaign
    @campaign = Campaign.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def campaign_params
    params.require(:campaign).permit(:user_id, :title, :description, :link, :paymenttype, :paymentamount, files: [])
  end

  def acceptedpost?
    params[:commit] == "Accept Project"
  end

  def rejectedpost?
    params[:commit] == "Reject Project"
  end


end
