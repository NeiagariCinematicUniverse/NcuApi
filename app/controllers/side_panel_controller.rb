class SidePanelController < ApplicationController
    def side
        dataStream = File.open("./side_panels/" + params[:id] + ".md")
        @pageContent = dataStream.read()
    end
end
