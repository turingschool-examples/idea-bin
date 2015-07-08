MagicLamp.fixture do
  Idea.create([
    { title: 'First Idea', body: 'Wowowow' },
    { title: 'Second Idea', body: 'Hehehehe' }
  ])
  render template: 'ideas/index'
end
