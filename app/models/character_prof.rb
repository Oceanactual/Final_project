# == Schema Information
#
# Table name: character_profs
#
#  id              :integer          not null, primary key
#  acrobatics      :boolean
#  animal_handling :boolean
#  arcana          :boolean
#  athletics       :boolean
#  chr_save        :boolean
#  con_save        :boolean
#  deception       :boolean
#  dex_save        :boolean
#  history         :boolean
#  insight         :boolean
#  int_save        :boolean
#  intimidation    :boolean
#  investigation   :boolean
#  medicine        :boolean
#  nature          :boolean
#  perception      :boolean
#  performance     :boolean
#  persuasion      :boolean
#  religion        :boolean
#  sleight_of_hand :boolean
#  stealth         :boolean
#  str_save        :boolean
#  survival        :boolean
#  wis_save        :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  character_id    :integer
#
class CharacterProf < ApplicationRecord
end
