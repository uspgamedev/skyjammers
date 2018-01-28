
endings = {
    'save_town': [
        "Expertly using the control equipment, you notify the town of the falling asteroid. The town is quickly evacuated.",
        "As your imminent doom approaches, you remember you're actually controlling a robot remotely via VR.",
        "You quickly remove your headset, and find yourself in an identical control room. A safe one.",
        "You are hailed as a hero for your actions."
    ],
    'escape':[
        "You quickly leave the control room, abandoning the town for its own fate.",
        "You are momentarily saddened for the abandoned town you were visiting.",
        "It is completely obliterated. In the crater created by the impact, you find a cave.",
        "In the cave, you discover an ancient human settlement. It is a staggering archeological discovery.",
        "You are hailed as a hero for your cowardice."
    ],
    'button': [
        "You push the big red button. There is a bright flash of light as a giant lobster appears.",
        "Teh giant lobster easily swats the asteroids away, and immediately leaves.",
        "As you try to understand what just happened, the townspeople rush over.",
        "You are hailed as a hero for your recklessness."
    ],
    'jump':[
        "You jump in place.",
        "This accomplishes absolutely nothing.",
        "The asteroids are completely baffled by this, and decide to find a better place to fall onto.",
        "You are hailed as a hero for your senselessness."
    ],
    'sing':[
        "You sing terribly.",
        "It's so bad, the asteroids shatter.",
        "Unfortunately, your singing was broadcast to the town, and everyone has left as a result."
    ],
    'jam':[
        "You opt to quickly make a game in the short time you have left.",
        "It's a pretty good game, if you do say so yourself.",
        "The asteroids decide to play your game.",
        "They are too busy playing to destroy anything.",
        "You are hailed as a hero for your game-making skills."
    ],
    'look':[
        "You look intently at the asteroids",
        "They start looking back at you.",
        "You enter a staring contest.",
        "This buys enough time for everyone in town to escape.",
        "You eventually win, and the asteroids leave in shame.",
        "You are hailed as a hero for your staring skills."
    ],
    'nothing':[
        "You stay absolutely still.",
        "The asteroids fall.",
        "Everybody d- oh, wait, the asteroids bounce back. Tuns out they're completely harmless.",
        "You are hailed as a hero for your inaction."
    ]
}

answers = {
    'save town': endings['save_town'],
    'warn town': endings['save_town'],
    'run away': endings['escape'],
    'escape': endings['escape'],
    'flee': endings['escape'],
    'jump': endings['jump'],
    'press button': endings['button'],
    'push button': endings['button'],
    'press red button': endings['button'],
    'push red button': endings['button'],
    'press random button': endings['button'],
    'push random button': endings['button'],
    'jam': endings['jam'],
    'make game': endings['jam'],
    'make a game': endings['jam'],
    'look': endings['look'],
    'nothing': endings['nothing'],
}

helptexts = ["Fine, fine, here's what you can do:"]
for answer in answers.keys():
    helptexts.append(answer)
helptexts.append("\nThe asteroids see that you are not ready yet, and decide to come back later.")
helptexts.append("You are temporarily hailed as a hero for your unpreparedness.")

answers['help'] = helptexts

print('Welcome traveler!')
print('You are in a control room. In fron of you, you see a control panel. It looks very control-y.')
print('Outside, you see an asteroid quickly approaching your position. There is another one quickly headed to the nearest town.')
print('What will you do?')

for i in range(3):
    answer = input()
    if answer in answers:
        for text in answers[answer]:
            print(text)
        print('Press enter to exit...')
        input()
        exit(0)
    print("I'm sorry, I didn't quite catch that.")

print('Unfortunately, your time is over. There is nothing you can do as the asteroids approach.')
print('Thankfully, there is nothing to be done, for the asteroids are actually self-destructing giant piñatas.')
print('Your actions have resulted in free candy for everyone. \nYou are hailed as a hero for your inaction.')
print('Press enter to exit...')
input()
