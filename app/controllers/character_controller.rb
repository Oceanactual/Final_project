class CharacterController < ApplicationController

  def home
    render({:template => "character/index"})
  end

  def edit
    races_web = HTTP.get("https://www.dnd5eapi.co/api/races")
    raw_races = JSON.parse(races_web)
    @races = raw_races.fetch("results")
    classes_web = HTTP.get("https://www.dnd5eapi.co/api/classes")
    raw_classes = JSON.parse(classes_web)
    @classes = raw_classes.fetch("results")
    backgrounds_web = HTTP.get("https://www.dnd5eapi.co/api/backgrounds")
    raw_backgrounds = JSON.parse(backgrounds_web)
    @backgrounds = raw_backgrounds.fetch("results")




    render({:template => "character/profile"})
  end
end
