class CharacterController < ApplicationController

  def home
    @my_character_list = Character.where({:users_id => current_user.id})
    render({:template => "character/home"})
  end

  def show
    matching_characters = Character.where({ :id => params.fetch("id") })
    @character = matching_characters.at(0)
  
    render({ :template => "character/show" })
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
    char.users_id = current_user.id

    hp_web = HTTP.get("https://www.dnd5eapi.co/api/classes/#{params.fetch("clas")}")
    raw_hp = JSON.parse(hp_web)
    hp = raw_hp.fetch("hit_die")

    if char.level == 1
      char.total_hp = hp.to_i + (char.con_score-10)/2
    else
      avg_hp = hp.to_i/2
      part_hp = avg_hp+1
      level_hp = part_hp*char.level
      con_bonus = ((char.con_score-10)/2)*char.level
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
    the_character_prof = CharacterProf.new
    the_character_prof.str_save = params.fetch("query_str_save", false)
    the_character_prof.dex_save = params.fetch("query_dex_save", false)
    the_character_prof.con_save = params.fetch("query_con_save", false)
    the_character_prof.int_save = params.fetch("query_int_save", false)
    the_character_prof.wis_save = params.fetch("query_wis_save", false)
    the_character_prof.chr_save = params.fetch("query_chr_save")
    the_character_prof.athletics = params.fetch("query_athletics", false)
    the_character_prof.acrobatics = params.fetch("query_acrobatics", false)
    the_character_prof.sleight_of_hand = params.fetch("query_sleight_of_hand", false)
    the_character_prof.stealth = params.fetch("query_stealth", false)
    the_character_prof.arcana = params.fetch("query_arcana", false)
    the_character_prof.history = params.fetch("query_history", false)
    the_character_prof.investigation = params.fetch("query_investigation", false)
    the_character_prof.nature = params.fetch("query_nature", false)
    the_character_prof.religion = params.fetch("query_religion", false)
    the_character_prof.animal_handling = params.fetch("query_animal_handling", false)
    the_character_prof.insight = params.fetch("query_insight", false)
    the_character_prof.medicine = params.fetch("query_medicine", false)
    the_character_prof.perception = params.fetch("query_perception", false)
    the_character_prof.survival = params.fetch("query_survival", false)
    the_character_prof.deception = params.fetch("query_deception", false)
    the_character_prof.intimidation = params.fetch("query_intimidation", false)
    the_character_prof.persuasion = params.fetch("query_persuasion", false)
    the_character_prof.performance = params.fetch("query_performance", false)
    the_character_prof.character_id = char.id

    the_character_prof.save


    redirect_to("/insert_character_prof", {:notice => "Post created successfully." })
  end
end
