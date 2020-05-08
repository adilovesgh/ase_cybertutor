class ConversationsController < ApplicationController
  def create
    @conversation = Conversation.get(current_account.id, params[:account_id])
    
    add_to_conversations unless conversated?

    respond_to do |format|
      format.js
    end
  end

  def close
    @conversation = Conversation.find(params[:id])
    # @conversation = Conversation.find(params[:account_id])

    #puts("Deleting conversation..................................................")
    #puts("Conversation to delete: #{@conversation}")

    session[:conversations].delete(@conversation.id)

    respond_to do |format|
      format.js
    end
  end

  private

  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end

  def conversated?
    session[:conversations].include?(@conversation.id)
  end
end