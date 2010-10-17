require 'nokogiri'
require 'open-uri'

class LinksController < ApplicationController
  layout 'application', :except => [:process_short_url, :get_page_title]
  
  # GET /links
  # GET /links.xml
  def index
    @links = current_user.links.paginate :page => params[:page], :per_page => 10, :order => 'post_date DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @links }
    end
  end

  # PUT /links/1
  # PUT /links/1.xml
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to(@link, :notice => 'Link was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.xml
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to(links_url) }
      format.xml  { head :ok }
    end
  end
  
  def process_short_url
    @link = Link.find(params[:id])
    
    if @link.url.blank?
      begin
        site = open(@link.short_url)
        doc = Nokogiri::HTML(site)
        
        @link.title = doc.css('title').children.text
        @link.description = doc.css('description').children.text
        @link.url = site.base_uri.to_s
        
        @link.save
      rescue
        @link.url = @link.short_url
      end
    end
  end
  
  def get_page_title
    @link = Link.find(params[:id]) 
  end
end
