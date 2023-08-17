# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  background :string
#  cha_score  :integer
#  clas       :string
#  con_score  :integer
#  current_hp :integer
#  dex_score  :integer
#  gold       :integer
#  int_score  :integer
#  level      :integer
#  name       :string
#  race       :string
#  str_score  :integer
#  sub_race   :string
#  total_hp   :integer
#  wis_score  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  users_id   :integer
#
class Character < ApplicationRecord
end
