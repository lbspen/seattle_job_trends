class SnapshotsController < ApplicationController
  def index
    @snapshots = Snapshot.all
  end

  def new
    @snapshot = Snapshot.new
  end

  def create
    snapshot = Snapshot.new(params[:snapshot])
    snapshot.populate(request.remote_ip)
    redirect_to snapshot, :notice => "Snapshot retrieved."
  end

  def show
    @snapshot = Snapshot.find(params[:id])  
  end
end
