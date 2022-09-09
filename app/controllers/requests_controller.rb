# frozen_string_literal: true

class RequestsController < ApplicationController
  include BuildRelationship

  def create
    recipient_id = params[:recipient_id]
    @request = current_user.requests_sent.new(recipient_id: recipient_id)
    recipient = User.find_by(id: recipient_id)
    if recipient.nil?
      flash[:danger] = 'Failed to create the request'
    else
      @request.status = recipient.kind.eql?('private') ? 'pending' : 'accepted'
      flash[:success] = @request.save ? 'Request sent!' : @request.errors.full_messages
    end
    redirect_to user_path(current_user.id)
  end

  def destroy
    @request = Request.find_by(id: params[:id])
    if @request.nil?
      flash[:danger] = 'Failed to destroy the request'
    else
      flash[:success] = @request.destroy ? 'Request was successfuly deleted.' : @request.errors.full_messages
    end
  end

  def update
    @request = Request.where(sender_id: params[:follow_id]).first
    @request.update(status: 'accepted') if @request.status == 'pending'
    render_error('Request') if @request.nil?
    @request.update(status: 'accepted') if @request.status == 'pending'
    following_id = params[:follow_id]
    buildrelation(following_id, current_user.id)
  end

  # def update_request
  #   @request = Request.where(sender_id: params[:follow_id]).first
  #   @request.update(status: 'accepted') if @request.status == 'pending'
  #   render_error('Request') if @request.nil?
  # end

  # def generate_request(recipient_id)
  #   @request = current_user.requests_sent.new(recipient_id: recipient_id)
  #   recipient = User.find_by(id: recipient_id)
  #   if recipient.nil?
  #     render_error('User')
  #   else
  #     @request.status = recipient.kind.eql?('private') ? 'pending' : 'accepted'
  #     flash[:notice] = @request.save ? 'Request sent!' : @request.errors.full_messages
  #   end
  # end

  # def set_request
  #   @request = Request.find_by(id: params[:id])
  #   render_error('Request') if @request.nil?
  # end
end
