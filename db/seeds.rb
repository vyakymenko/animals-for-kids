animals = [
  # Mammals
  { name: "Lion", emoji: "🦁", category: "Mammals",
    description: "The lion is called the King of the Jungle! They live in Africa and love to roar very loudly.",
    fun_fact: "A lion's roar can be heard from 8 km away!" },
  { name: "Elephant", emoji: "🐘", category: "Mammals",
    description: "Elephants are the biggest land animals on Earth. They have a long trunk they use to drink water and pick up food.",
    fun_fact: "Elephants never forget — they have amazing memories!" },
  { name: "Dolphin", emoji: "🐬", category: "Mammals",
    description: "Dolphins are super smart and love to play. They swim in the ocean and can jump very high out of the water!",
    fun_fact: "Dolphins sleep with one eye open!" },
  { name: "Panda", emoji: "🐼", category: "Mammals",
    description: "Giant pandas are black and white bears from China. They spend most of their day eating bamboo.",
    fun_fact: "A panda can eat up to 40 kg of bamboo in one day!" },
  { name: "Kangaroo", emoji: "🦘", category: "Mammals",
    description: "Kangaroos live in Australia and carry their babies in a pouch on their tummy. They can jump really far!",
    fun_fact: "Baby kangaroos are called joeys!" },
  { name: "Giraffe", emoji: "🦒", category: "Mammals",
    description: "Giraffes are the tallest animals in the world! Their long neck helps them eat leaves from tall trees.",
    fun_fact: "A giraffe's tongue is 45 cm long and dark blue!" },
  { name: "Polar Bear", emoji: "🐻‍❄️", category: "Mammals",
    description: "Polar bears live in the Arctic where it's very cold and icy. Their white fur keeps them warm.",
    fun_fact: "Polar bear fur is actually clear, not white!" },

  # Birds
  { name: "Eagle", emoji: "🦅", category: "Birds",
    description: "Eagles are powerful birds that can fly very high and see tiny things from far away. They are great hunters!",
    fun_fact: "Eagles can spot a rabbit from 3 km away!" },
  { name: "Penguin", emoji: "🐧", category: "Birds",
    description: "Penguins are birds that cannot fly, but they are amazing swimmers! They live where it is very cold.",
    fun_fact: "Penguins can hold their breath for 20 minutes!" },
  { name: "Parrot", emoji: "🦜", category: "Birds",
    description: "Parrots are very colorful birds that can copy what people say! They live in tropical jungles.",
    fun_fact: "Some parrots can learn over 1000 words!" },
  { name: "Flamingo", emoji: "🦩", category: "Birds",
    description: "Flamingos are pink birds that stand on one leg. They turn pink because of the food they eat!",
    fun_fact: "Flamingos are born white — they turn pink later!" },
  { name: "Owl", emoji: "🦉", category: "Birds",
    description: "Owls are night birds with big round eyes. They can turn their head almost all the way around!",
    fun_fact: "Owls don't have eyeballs — they have eye tubes!" },

  # Reptiles
  { name: "Crocodile", emoji: "🐊", category: "Reptiles",
    description: "Crocodiles are ancient reptiles that have been on Earth for millions of years. They have very strong jaws!",
    fun_fact: "Crocodiles can't stick out their tongue!" },
  { name: "Chameleon", emoji: "🦎", category: "Reptiles",
    description: "Chameleons can change the color of their skin! They use this to hide and to show their feelings.",
    fun_fact: "Chameleons have eyes that move in two directions at once!" },
  { name: "Sea Turtle", emoji: "🐢", category: "Reptiles",
    description: "Sea turtles have been swimming in the ocean for over 100 million years! They can hold their breath for hours.",
    fun_fact: "Sea turtles always return to the same beach to lay eggs!" },
  { name: "Gecko", emoji: "🦎", category: "Reptiles",
    description: "Geckos are little lizards that can walk on ceilings and walls! Their feet are covered in tiny hairs.",
    fun_fact: "Geckos lick their eyes to clean them!" },

  # Fish
  { name: "Clownfish", emoji: "🐠", category: "Fish",
    description: "Clownfish are orange with white stripes. They live with sea anemones which protect them from danger.",
    fun_fact: "Nemo is a clownfish! They can live in stinging anemones safely." },
  { name: "Shark", emoji: "🦈", category: "Fish",
    description: "Sharks are powerful fish that have been in the ocean for millions of years. Most sharks are not dangerous to people!",
    fun_fact: "Sharks never run out of teeth — they grow new ones!" },
  { name: "Seahorse", emoji: "🐴", category: "Fish",
    description: "Seahorses are tiny fish shaped like horses. They swim upright and hold onto seaweed with their tail.",
    fun_fact: "Dad seahorses carry the babies, not moms!" },
  { name: "Octopus", emoji: "🐙", category: "Fish",
    description: "Octopuses have eight arms and are very clever. They can open jars and solve puzzles!",
    fun_fact: "Octopuses have three hearts and blue blood!" },

  # Insects
  { name: "Butterfly", emoji: "🦋", category: "Insects",
    description: "Butterflies start life as caterpillars and transform into beautiful winged creatures. This is called metamorphosis!",
    fun_fact: "Butterflies taste with their feet!" },
  { name: "Bee", emoji: "🐝", category: "Insects",
    description: "Bees make honey and help flowers grow by carrying pollen. Without bees, many plants would disappear!",
    fun_fact: "A bee visits 2000 flowers to make one spoon of honey!" },
  { name: "Ladybug", emoji: "🐞", category: "Insects",
    description: "Ladybugs are little red beetles with black spots. Farmers love them because they eat harmful bugs!",
    fun_fact: "You can tell a ladybug's age by counting its spots!" },
  { name: "Firefly", emoji: "✨", category: "Insects",
    description: "Fireflies are magical insects that glow in the dark! They use their light to find friends at night.",
    fun_fact: "Fireflies produce cold light — it makes no heat at all!" },
  { name: "Ant", emoji: "🐜", category: "Insects",
    description: "Ants are tiny but incredibly strong! They can carry things 50 times heavier than themselves.",
    fun_fact: "An ant colony can have millions of ants working together!" }
]

animals.each do |attrs|
  Animal.find_or_create_by(name: attrs[:name]) do |a|
    a.emoji       = attrs[:emoji]
    a.category    = attrs[:category]
    a.description = attrs[:description]
    a.fun_fact    = attrs[:fun_fact]
  end
end

puts "Seeded #{Animal.count} animals!"
