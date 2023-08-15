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

  def save
    char = Character.new
    char.name = params.fetch("query_name")
    char.race = params.fetch("race")
    char.clas = params.fetch("clas")
    char.background = params.fetch("background")
    char.level = params.fetch("level")
    char.str_score = params.fetch("strength_score")
    char.dex_score = params.fetch("dexterity_score")
    char.con_score = params.fetch("constitution_score")
    char.int_score = params.fetch("intelligence_score")
    char.wis_score = params.fetch("wisdom_score")
    char.cha_score = params.fetch("charisma_score")

    hp_web = HTTP.get("https://www.dnd5eapi.co/api/classes/#{char.clas}")
    raw_hp = JSON.parse(hp_web)
    hp = raw_hp.fetch("hit_die")

    if char.level == 1
      char.total_hp = hp.to_i + char.con_score
    else
      avg_hp = hp.to_i/2
      part_hp = avg_hp+1
      level_hp = part_hp*char.level
      con_bonus = char.con_score*char.level
      char.total_hp = level_hp+con_bonus
    end

    if char.gold == nil
      char.gold = 0
    end

    if char.sub_race == nil
      char.sub_race = "none"
    end

    if char.current_hp == nil
      char.current_hp = char.total_hp
    end

    char.save

    # if char.valid?
    #   char.save
      redirect_to({:template => "characters/#{char.id}", :notice => "Post created successfully." })
    # else
    #   render({:template => "characters/#{char.id}", :alert => the_post.errors.full_messages.to_sentence })
    # end
  end
end
