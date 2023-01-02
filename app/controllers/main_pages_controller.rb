class MainPagesController < ApplicationController
  def list
    mainPages = Dir.glob("./main_pages/*.md")
    @pageList = Array.new(0)

    for page in mainPages do
      page_url = "?" + page[13..-4]
      page_name = page[13..-4]
      
      if page_name.include?("_")
        page_name.gsub!(/_/, " ")
      end

      page_object = Page.new(page_url, page_name)
      @pageList.append(page_object)
    end
  end
  
  def page
    dataStream = File.open("./main_pages/" + params[:id] + ".md")
    @pageContent = dataStream.read()
  end
end
