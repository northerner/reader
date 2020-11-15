class EntriesController < ApplicationController
  def show 
    @entry = Entry.find(params[:id])
    @entry.update(read: true)
  end
end
