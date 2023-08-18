class CharactersController < ApplicationController
  def index
    races_web = HTTP.get("https://www.dnd5eapi.co/api/races")
    raw_races = JSON.parse(races_web)
    @races = raw_races.fetch("results")
    classes_web = HTTP.get("https://www.dnd5eapi.co/api/classes")
    raw_classes = JSON.parse(classes_web)
    @classes = raw_classes.fetch("results")
    backgrounds_web = HTTP.get("https://www.dnd5eapi.co/api/backgrounds")
    raw_backgrounds = JSON.parse(backgrounds_web)
    @backgrounds = raw_backgrounds.fetch("results")
    matching_characters = Character.all

    @list_of_characters = matching_characters.order({ :created_at => :desc })

    render({ :template => "characters/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_characters = Character.where({ :id => the_id })
    matching_prof = CharacterProf.where({ :character_id => the_id })

    @the_character = matching_characters.at(0)
    @the_prof = matching_prof.at(0)

    @prof_bonus = (@the_character.level / 4) + 2

    @profic = Hash.new

    if @the_prof.str_save == true
      strength_save = (@the_character.str_score - 10) / 2 + @prof_bonus
      @profic.store(:strengthsave, "#{strength_save}")
    else
      strength_save = (@the_character.str_score - 10) / 2
      @profic.store(:strengthsave, "#{strength_save}")
    end
    if @the_prof.dex_save == true
      dexterity_save = (@the_character.dex_score - 10) / 2 + @prof_bonus
      @profic.store(:dexteritysave, "#{dexterity_save}")
    else
      dexterity_save = (@the_character.dex_score - 10) / 2
      @profic.store(:dexteritysave, "#{dexterity_save}")
    end
    if @the_prof.con_save == true
      constitution_save = (@the_character.con_score - 10) / 2 + @prof_bonus
      @profic.store(:constitutionsave, "#{constitution_save}")
    else
      constitution_save = (@the_character.con_score - 10) / 2
      @profic.store(:constitutionsave, "#{constitution_save}")
    end
    if @the_prof.int_save == true
      intelligence_save = (@the_character.int_score - 10) / 2 + @prof_bonus
      @profic.store(:intelligencesave, "#{intelligence_save}")
    else
      intelligence_save = (@the_character.int_score - 10) / 2
      @profic.store(:intelligencesave, "#{intelligence_save}")
    end
    if @the_prof.wis_save == true
      wisdom_save = (@the_character.wis_score - 10) / 2 + @prof_bonus
      @profic.store(:wisdomsave, "#{wisdom_save}")
    else
      wisdom_save = (@the_character.wis_score - 10) / 2
      @profic.store(:wisdomsave, "#{wisdom_save}")
    end
    if @the_prof.chr_save == true
      charisma_save = (@the_character.cha_score - 10) / 2 + @prof_bonus
      @profic.store(:charismasave, "#{charisma_save}")
    else
      charisma_save = (@the_character.cha_score - 10) / 2
      @profic.store(:charismasave, "#{charisma_save}")
    end

    if @the_prof.athletics == true
      athletics_check = (@the_character.str_score - 10) / 2 + @prof_bonus
      @profic.store(:athleticscheck, "#{athletics_check}")
    else
      athletics_check = (@the_character.str_score - 10) / 2
      @profic.store(:athleticscheck, "#{athletics_check}")
    end

    if @the_prof.acrobatics == true
      acrobatics_check = (@the_character.dex_score - 10) / 2 + @prof_bonus
      @profic.store(:acrobaticscheck, "#{acrobatics_check}")
    else
      acrobatics_check = (@the_character.dex_score - 10) / 2
      @profic.store(:acrobaticscheck, "#{acrobatics_check}")
    end
    if @the_prof.sleight_of_hand == true
      sleight_of_hand_check = (@the_character.dex_score - 10) / 2 + @prof_bonus
      @profic.store(:sleightofhandcheck, "#{sleight_of_hand_check}")
    else
      sleight_of_hand_check = (@the_character.dex_score - 10) / 2
      @profic.store(:sleightofhandcheck, "#{sleight_of_hand_check}")
    end
    if @the_prof.stealth == true
      stealth_check = (@the_character.dex_score - 10) / 2 + @prof_bonus
      @profic.store(:stealthcheck, "#{stealth_check}")
    else
      stealth_check = (@the_character.dex_score - 10) / 2
      @profic.store(:stealthcheck, "#{stealth_check}")
    end

    if @the_prof.arcana == true
      arcana_check = (@the_character.int_score - 10) / 2 + @prof_bonus
      @profic.store(:arcanacheck, "#{arcana_check}")
    else
      arcana_check = (@the_character.int_score - 10) / 2
      @profic.store(:arcanacheck, "#{arcana_check}")
    end
    if @the_prof.history == true
      history_check = (@the_character.int_score - 10) / 2 + @prof_bonus
      @profic.store(:historycheck, "#{history_check}")
    else
      history_check = (@the_character.int_score - 10) / 2
      @profic.store(:historycheck, "#{history_check}")
    end
    if @the_prof.nature == true
      nature_check = (@the_character.int_score - 10) / 2 + @prof_bonus
      @profic.store(:naturecheck, "#{nature_check}")
    else
      nature_check = (@the_character.int_score - 10) / 2
      @profic.store(:naturecheck, "#{nature_check}")
    end
    if @the_prof.investigation == true
      investigation_check = (@the_character.int_score - 10) / 2 + @prof_bonus
      @profic.store(:investigationcheck, "#{investigation_check}")
    else
      investigation_check = (@the_character.int_score - 10) / 2
      @profic.store(:investigationcheck, "#{investigation_check}")
    end
    if @the_prof.religion == true
      religion_check = (@the_character.int_score - 10) / 2 + @prof_bonus
      @profic.store(:religioncheck, "#{religion_check}")
    else
      religion_check = (@the_character.int_score - 10) / 2
      @profic.store(:religioncheck, "#{religion_check}")
    end

    if @the_prof.animal_handling == true
      animal_handling_check = (@the_character.wis_score - 10) / 2 + @prof_bonus
      @profic.store(:animalhandlingcheck, "#{animal_handling_check}")
    else
      animal_handling_check = (@the_character.wis_score - 10) / 2
      @profic.store(:animalhandlingcheck, "#{animal_handling_check}")
    end
    if @the_prof.insight == true
      insight_check = (@the_character.wis_score - 10) / 2 + @prof_bonus
      @profic.store(:insightcheck, "#{insight_check}")
    else
      insight_check = (@the_character.wis_score - 10) / 2
      @profic.store(:insightcheck, "#{insight_check}")
    end
    if @the_prof.medicine == true
      medicine_check = (@the_character.wis_score - 10) / 2 + @prof_bonus
      @profic.store(:medicinecheck, "#{medicine_check}")
    else
      medicine_check = (@the_character.wis_score - 10) / 2
      @profic.store(:medicinecheck, "#{medicine_check}")
    end
    if @the_prof.perception == true
      perception_check = (@the_character.wis_score - 10) / 2 + @prof_bonus
      @profic.store(:perceptioncheck, "#{perception_check}")
    else
      perception_check = (@the_character.wis_score - 10) / 2
      @profic.store(:perceptioncheck, "#{perception_check}")
    end
    if @the_prof.survival == true
      survival_check = (@the_character.wis_score - 10) / 2 + @prof_bonus
      @profic.store(:survivalcheck, "#{survival_check}")
    else
      survival_check = (@the_character.wis_score - 10) / 2
      @profic.store(:survivalcheck, "#{survival_check}")
    end

    if @the_prof.deception == true
      deception_check = (@the_character.cha_score - 10) / 2 + @prof_bonus
      @profic.store(:deceptioncheck, "#{deception_check}")
    else
      deception_check = (@the_character.cha_score - 10) / 2
      @profic.store(:deceptioncheck, "#{deception_check}")
    end
    if @the_prof.intimidation == true
      intimidation_check = (@the_character.cha_score - 10) / 2 + @prof_bonus
      @profic.store(:intimidationcheck, "#{intimidation_check}")
    else
      intimidation_check = (@the_character.cha_score - 10) / 2
      @profic.store(:intimidationcheck, "#{intimidation_check}")
    end
    if @the_prof.persuasion == true
      persuasion_check = (@the_character.cha_score - 10) / 2 + @prof_bonus
      @profic.store(:persuasioncheck, "#{persuasion_check}")
    else
      persuasion_check = (@the_character.cha_score - 10) / 2
      @profic.store(:persuasioncheck, "#{persuasion_check}")
    end
    if @the_prof.performance == true
      performance_check = (@the_character.cha_score - 10) / 2 + @prof_bonus
      @profic.store(:performancecheck, "#{performance_check}")
    else
      performance_check = (@the_character.cha_score - 10) / 2
      @profic.store(:performancecheck, "#{performance_check}")
    end
  

    render({ :template => "characters/show" })
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
    the_id = params.fetch("path_id")

    matching_characters = Character.where({ :id => the_id })

    @the_character = matching_characters.at(0)

    matching_prof = CharacterProf.where({ :character_id => the_id })

    @the_character_prof = matching_prof.at(0)

    render({ :template => "characters/edit" })
  end

  def create
    races_web = HTTP.get("https://www.dnd5eapi.co/api/races")
    raw_races = JSON.parse(races_web)
    @races = raw_races.fetch("results")
    classes_web = HTTP.get("https://www.dnd5eapi.co/api/classes")
    raw_classes = JSON.parse(classes_web)
    @classes = raw_classes.fetch("results")
    backgrounds_web = HTTP.get("https://www.dnd5eapi.co/api/backgrounds")
    raw_backgrounds = JSON.parse(backgrounds_web)
    @backgrounds = raw_backgrounds.fetch("results")

    the_character = Character.new
    the_character.name = params.fetch("query_name")
    the_character.class = params.fetch("query_class")
    the_character.level = params.fetch("query_level")
    the_character.race = params.fetch("query_race")
    the_character.sub_race = params.fetch("query_sub_race")
    the_character.background = params.fetch("query_background")
    the_character.str_score = params.fetch("query_str_score")
    the_character.dex_score = params.fetch("query_dex_score")
    the_character.con_score = params.fetch("query_con_score")
    the_character.int_score = params.fetch("query_int_score")
    the_character.wis_score = params.fetch("query_wis_score")
    the_character.cha_score = params.fetch("query_cha_score")
    the_character.total_hp = params.fetch("query_total_hp")
    the_character.current_hp = params.fetch("query_current_hp")
    the_character.gold = params.fetch("query_gold")

    if the_character.valid?
      the_character.save
      redirect_to("/characters", { :notice => "Character created successfully." })
    else
      redirect_to("/characters", { :alert => the_character.errors.full_messages.to_sentence })
    end

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
  end

  def update
    races_web = HTTP.get("https://www.dnd5eapi.co/api/races")
    raw_races = JSON.parse(races_web)
    @races = raw_races.fetch("results")
    classes_web = HTTP.get("https://www.dnd5eapi.co/api/classes")
    raw_classes = JSON.parse(classes_web)
    @classes = raw_classes.fetch("results")
    backgrounds_web = HTTP.get("https://www.dnd5eapi.co/api/backgrounds")
    raw_backgrounds = JSON.parse(backgrounds_web)
    @backgrounds = raw_backgrounds.fetch("results")

    the_id = params.fetch("path_id")
    the_character = Character.where({ :id => the_id }).at(0)

    the_character.name = params.fetch("query_name")
    the_character.race = the_character.race
    the_character.clas = the_character.clas
    the_character.background = the_character.background
    the_character.level = params.fetch("query_level")
    the_character.str_score = params.fetch("query_str_score")
    the_character.dex_score = params.fetch("query_dex_score")
    the_character.con_score = params.fetch("query_con_score")
    the_character.int_score = params.fetch("query_int_score")
    the_character.wis_score = params.fetch("query_wis_score")
    the_character.cha_score = params.fetch("query_cha_score")
    the_character.total_hp = params.fetch("query_total_hp")
    the_character.current_hp = params.fetch("query_current_hp")
    the_character.gold = params.fetch("query_gold")
    the_character.users_id = current_user.id

    hp_web = HTTP.get("https://www.dnd5eapi.co/api/classes/#{the_character.clas}")
    raw_hp = JSON.parse(hp_web)
    hp = raw_hp.fetch("hit_die")

    if the_character.level == 1
      the_character.total_hp = hp.to_i + (the_character.con_score - 10) / 2
    else
      avg_hp = hp.to_i / 2
      part_hp = avg_hp + 1
      level_hp = part_hp * the_character.level
      con_bonus = ((the_character.con_score - 10) / 2) * the_character.level
      the_character.total_hp = level_hp + con_bonus
    end

    if the_character.gold == nil
      the_character.gold = 0
    end

    if the_character.sub_race == nil
      the_character.sub_race = "none"
    end

    if the_character.valid?
      the_character.save
      redirect_to("/characters/#{the_character.id}", { :notice => "Character updated successfully." })
    else
      puts the_character.errors.full_messages
      redirect_to("/characters/#{the_character.id}", { :alert => the_character.errors.full_messages.to_sentence })
    end

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
  end

  def destroy
    the_id = params.fetch("path_id")
    the_character = Character.where({ :id => the_id }).at(0)

    the_character.destroy

    redirect_to("/characters", { :notice => "Character deleted successfully." })
  end
end
