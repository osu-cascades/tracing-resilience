module SystemHelpers

  def create_new_measure(category: 'General', featured: false)
    visit new_measure_path
    fill_in('Title', with: 'Example')
    fill_in('Description', with: 'Fake description')
    select(category, from: 'Category')
    page.attach_file('Document', Rails.root + 'spec/factories/attachments/example.pdf')
    if featured then check('Featured?') end
    click_on('Save')
  end

  def featured_measure_count
    Measure.all.count { |m| m.featured == true }
  end
end