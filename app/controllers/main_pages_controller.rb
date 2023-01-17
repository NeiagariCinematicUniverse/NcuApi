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
    filePath = "./main_pages/" + params[:id] + ".md"

    if File.exists?(filePath) then
      dataStream = File.open(filePath)
      @pageContent = dataStream.read()
    else
      return head 204
    end
  end
end
