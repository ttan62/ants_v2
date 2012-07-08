class NotesController < ApplicationController
  # GET /notes
  # GET /notes.json
  def index
    @project = Project.find(params[:project_id])
    @notes = @project.notes.all
    if :search.is_a?(String)
      @notes = Note.search(params[:search])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @project = Project.find(params[:project_id])
    @note = @project.notes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @project = Project.find(params[:project_id])
    @note = Note.new(:project_id => @project.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @note = @project.notes.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @project = Project.find(params[:project_id])
    @note = @project.notes.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to [@project, @note], notice: 'Note was successfully created.' }
        format.json { render json: [@project, @note], status: :created, location: [@project, @note] }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @project = Project.find(params[:project_id])
    @note = @project.notes.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to [@project, @note], notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @note = @project.notes.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to project_notes_url(@project) }
      format.json { head :no_content }
    end
  end
end
