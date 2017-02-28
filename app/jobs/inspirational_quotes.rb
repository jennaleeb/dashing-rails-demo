quotes = [
	'You should give a fuck. You really should. But only about things that set your soul on fire. Save your fucks for magical shit',
	"Live every week like it's shark week",
	"Another magical quote"
]

Dashing.scheduler.every '2s' do
  random_quote = quotes.sample
  Dashing.send_event('inspirational-quote', { title: 'the hustle quote', text: random_quote })
end