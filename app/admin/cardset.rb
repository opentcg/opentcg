ActiveAdmin.register Cardset do

  permit_params :identifier, :master_card, cards_attributes: [:image]

  index do
    selectable_column
    id_column
    column :identifier
    column :updated_at
    column :created_at
    actions
  end

  index as: :grid, default: true do |cardset|
    link_to admin_cardset_path(cardset) do
      s = ""
      s << image_tag(cardset.master_card.url)
      s << "<br /><strong>#{cardset.identifier}</strong>"
      s.html_safe
    end
  end

  filter :identifier
  filter :created_at

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Cardset" do
      f.input   :identifier
      f.input   :master_card, :hint => f.template.image_tag(f.object.master_card.url)
    end
    f.inputs do
      f.has_many :cards, heading: 'Cards', new_record: 'Add Card', :multipart => true do |c|
        c.input   :image, :hint => c.template.image_tag(c.object.image.url)
      end
    end
    f.actions
  end

  show do |cardset|
    attributes_table do
      row :identifier
      row :updated_at
      row :created_at
      row :master_card do
        image_tag(cardset.master_card.url)
      end
      row :cards do
        s = ""
        cardset.cards.each do |card|
          s << image_tag(card.image.url)
        end
        s.html_safe
      end
    end
  end
  
end
