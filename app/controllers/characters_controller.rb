class CharactersController < ApplicationController
  def index
    matching_characters = Character.all

    @list_of_characters = matching_characters.order({ :created_at => :desc })

    render({ :template => "characters/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_characters = Character.where({ :id => the_id })

    @the_character = matching_characters.at(0)

    render({ :template => "characters/show" })
  end

  def create
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
  end

  def update
    the_id = params.fetch("path_id")
    the_character = Character.where({ :id => the_id }).at(0)

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
      redirect_to("/characters/#{the_character.id}", { :notice => "Character updated successfully."} )
    else
      redirect_to("/characters/#{the_character.id}", { :alert => the_character.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_character = Character.where({ :id => the_id }).at(0)

    the_character.destroy

    redirect_to("/characters", { :notice => "Character deleted successfully."} )
  end
end
