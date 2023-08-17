class CharacterProfsController < ApplicationController
  def index
    matching_character_profs = CharacterProf.all

    @list_of_character_profs = matching_character_profs.order({ :created_at => :desc })

    render({ :template => "character_profs/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_character_profs = CharacterProf.where({ :id => the_id })

    @the_character_prof = matching_character_profs.at(0)

    render({ :template => "character_profs/show" })
  end

  def create
    the_character_prof = CharacterProf.new
    the_character_prof.str_save = params.fetch("query_str_save", false)
    the_character_prof.dex_save = params.fetch("query_dex_save", false)
    the_character_prof.con_save = params.fetch("query_con_save", false)
    the_character_prof.int_save = params.fetch("query_int_save", false)
    the_character_prof.wis_save = params.fetch("query_wis_save", false)
    the_character_prof.cha_save_boolean = params.fetch("query_cha_save_boolean")
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

    if the_character_prof.valid?
      the_character_prof.save
      redirect_to("/character_profs", { :notice => "Character prof created successfully." })
    else
      redirect_to("/character_profs", { :alert => the_character_prof.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_character_prof = CharacterProf.where({ :id => the_id }).at(0)

    the_character_prof.str_save = params.fetch("query_str_save", false)
    the_character_prof.dex_save = params.fetch("query_dex_save", false)
    the_character_prof.con_save = params.fetch("query_con_save", false)
    the_character_prof.int_save = params.fetch("query_int_save", false)
    the_character_prof.wis_save = params.fetch("query_wis_save", false)
    the_character_prof.cha_save_boolean = params.fetch("query_cha_save_boolean")
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

    if the_character_prof.valid?
      the_character_prof.save
      redirect_to("/character_profs/#{the_character_prof.id}", { :notice => "Character prof updated successfully."} )
    else
      redirect_to("/character_profs/#{the_character_prof.id}", { :alert => the_character_prof.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_character_prof = CharacterProf.where({ :id => the_id }).at(0)

    the_character_prof.destroy

    redirect_to("/character_profs", { :notice => "Character prof deleted successfully."} )
  end
end
