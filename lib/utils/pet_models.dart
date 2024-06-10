import 'package:flutter/material.dart';

final Map<String, dynamic> dogInfo = {
  'type': "Chiens",
  'bgColor': Colors.brown[300],
  'pic':
      "https://firebasestorage.googleapis.com/v0/b/phoebe-d60af.appspot.com/o/d.png?alt=media&token=c820d860-b701-4197-bede-80c7d8916066",
  'title_1': "Quels sont les aliments à ne pas donner à un chien?",
  'description_1':
      "Il y a plusieurs aliments que vous devriez éviter de donner à un chien, car ils peuvent être toxiques ou causer des problèmes de santé. Voici une liste des aliments les plus courants à éviter :",
  'list_1': [
    "•	Chocolat",
    "Le chocolat contient de la théobromine, une substance toxique pour les chiens qui peut provoquer des symptômes graves tels que vomissements, diarrhée, agitation, arythmies cardiaques et même la mort dans les cas graves.",
    "•	Avocat",
    "L'avocat contient une substance appelée persine, qui peut être toxique pour les chiens en grande quantité et provoquer des vomissements et de la diarrhée.",
    "•	Raisins et raisins secs",
    "Même de petites quantités de raisins ou de raisins secs peuvent causer une insuffisance rénale aiguë chez les chiens, entraînant des symptômes tels que vomissements, diarrhée, léthargie et diminution de l'appétit.",
    "•	Oignons et ail",
    "Ces aliments peuvent endommager les globules rouges des chiens et provoquer une anémie hémolytique. Les symptômes peuvent inclure faiblesse, vomissements, diarrhée et difficulté à respirer.",
    "•	Produits laitiers",
    "De nombreux chiens sont intolérants au lactose, ce qui peut provoquer des problèmes gastro-intestinaux tels que des ballonnements, des gaz, des diarrhées et des vomissements.",
    "•	Os cuits",
    "Les os cuits peuvent se briser en petits morceaux pointus et causer des blessures internes ou des obstructions intestinales chez les chiens.",
    "•	Produits sucrés",
    "Les aliments riches en sucre peuvent entraîner des problèmes de santé tels que l'obésité, le diabète et des troubles dentaires chez les chiens.",
    "•	Alcool",
    "L'alcool peut provoquer une intoxication chez les chiens, avec des symptômes tels que des vomissements, de la diarrhée, des difficultés respiratoires, des changements de comportement et même un coma."
  ],
  'title_2': "Quel type d’alimentation faut-il donner à son chien?",
  'description_2':
      "L'alimentation d'un chien domestique est également un aspect crucial de ses soins et de son bien-être. Tout comme pour les chats, l'alimentation d'un chien peut varier en fonction de ses préférences individuelles, de ses besoins nutritionnels et de son état de santé. Les options alimentaires pour les chiens comprennent les croquettes, la nourriture humide, les friandises et, dans certains cas, des suppléments tels que des fruits et des légumes, bien que ceux-ci doivent être donnés avec modération.",
  'list_2': [
    "•	Les croquettes",
    "Les croquettes sont souvent le choix privilégié des propriétaires de chiens en raison de leur praticité. Elles sont faciles à stocker et à servir, et peuvent être laissées à disposition de votre chien tout au long de la journée sans risque de se gâter.",
    "•	La nourriture humide",
    "La nourriture humide, sous forme de pâtée, est également une option populaire pour les chiens. Elle est appréciée pour sa texture et son arôme, et sa teneur élevée en eau peut contribuer à une bonne hydratation, en particulier pour les chiens qui ne boivent pas beaucoup d'eau.",
    "•	Les friandises",
    "Les friandises pour chiens sont souvent utilisées pour le renforcement positif lors de l'entraînement ou simplement comme récompense. Il est important de choisir des friandises saines et équilibrées, car elles peuvent être riches en calories et en gras.",
    "•	Suppléments alimentaires",
    "Certains propriétaires choisissent d'ajouter des fruits et des légumes à l'alimentation de leur chien pour fournir des vitamines, des minéraux et des fibres supplémentaires."
  ],
  'title_3': "Les vaccins de mon chien",
  'description_3':
      "Les vaccins sont un élément essentiel des soins de santé préventifs pour votre chien, car ils aident à protéger contre diverses maladies graves et potentiellement mortelles. Voici un aperçu des vaccins recommandés pour la plupart des chiens",
  'list_3': [
    "•	La maladie de Carré",
    "Ce vaccin protège contre le virus responsable de la maladie de Carré, une infection virale potentiellement mortelle qui affecte les voies respiratoires, gastro-intestinales et nerveuses des chiens.",
    "•	La parvovirose",
    "Ce vaccin protège contre le virus de la parvovirose, une maladie virale grave qui affecte le système gastro-intestinal des chiens, entraînant des symptômes tels que vomissements, diarrhée sévère et déshydratation.",
    "•	L'hépatite infectieuse canine (HIC)",
    "Ce vaccin protège contre le virus de l'hépatite canine, qui peut causer des problèmes de foie, des infections respiratoires et d'autres complications graves chez les chiens.",
    "•	La leptospirose",
    "Ce vaccin protège contre les bactéries de la leptospirose, qui peuvent être transmises par l'urine d'animaux sauvages et contaminer l'environnement. La leptospirose peut provoquer des symptômes graves chez les chiens, y compris des lésions hépatiques et rénales.",
    "•	La toux de chenil",
    "Ce vaccin protège contre les agents pathogènes qui causent la toux de chenil, une maladie respiratoire hautement contagieuse chez les chiens, souvent rencontrée dans des environnements à forte densité de chiens comme les pensions pour animaux ou les parcs à chiens.",
    "•	La rage",
    "Ce vaccin protège contre le virus de la rage, une maladie virale mortelle qui peut être transmise aux humains par les morsures d'animaux infectés. Dans de nombreux endroits, la vaccination antirabique est exigée par la loi pour les chiens."
  ],
  'title_4': "Les traitements antiparasitaires de votre chien",
  'description_4':
      "Les traitements antiparasitaires sont essentiels pour protéger votre chien contre les parasites nuisibles tels que les puces, les tiques, les vers intestinaux et les acariens. Voici un aperçu des principaux traitements antiparasitaires pour les chiens",
  'list_4': [
    "•	Antipuces et anti-tiques topiques",
    "Ces traitements sont généralement appliqués sur la peau du chien, souvent entre les omoplates, et offrent une protection continue contre les puces et les tiques pendant plusieurs semaines. Ils peuvent être disponibles sous forme de pipettes ou de colliers.",
    "•	Comprimés antipuces et anti-tiques",
    "Certains médicaments sont administrés par voie orale et agissent pour tuer les puces et les tiques une fois qu'elles ont mordu le chien. Ces comprimés offrent une protection rapide et peuvent durer jusqu'à plusieurs mois.",
    "•	Shampoings antiparasitaires",
    "Les shampoings antiparasitaires sont utilisés pour tuer les puces, les tiques et d'autres parasites présents sur le pelage du chien. Ils offrent un soulagement immédiat, mais leur efficacité est généralement limitée dans le temps.",
    "•	Traitements antiparasitaires à large spectre",
    "Certains médicaments sont conçus pour traiter plusieurs types de parasites à la fois, y compris les vers intestinaux, les vers du cœur et les ectoparasites tels que les puces et les tiques. Ces traitements peuvent être administrés sous forme de comprimés ou de solutions topiques.",
    "•	Prévention du ver du cœur",
    "Les médicaments préventifs du ver du cœur sont administrés mensuellement pour protéger les chiens contre cette maladie potentiellement mortelle transmise par les moustiques."
  ],
  'title_5': "Comment je protège mon chien ?",
  'description_5':
      "L'identification et la sécurité sont des aspects cruciaux de la vie de votre chien, garantissant son bien-être et sa protection en cas de perte ou de danger. Voici quelques mesures importantes à prendre",
  'list_5': [
    "•	Collier avec médaille d'identification",
    "Équiper votre chien d'un collier avec une médaille d'identification contenant vos coordonnées (nom, numéro de téléphone) peut être une mesure supplémentaire de sécurité. Cela permet à quiconque trouve votre chien de vous contacter facilement.",
    "•	Gardez votre chat à l'intérieur",
    "Maintenir votre chien à l'intérieur réduit considérablement les risques de perte, de vol ou de blessures dues à des accidents ou à des prédateurs extérieurs. Si votre chien sort à l'extérieur, assurez-vous qu'il porte un collier d'identification et qu'il est stérilisé pour éviter la reproduction non contrôlée.",
    "•	Stérilisation/castration",
    "En plus de contrôler la population v, la stérilisation ou la castration de votre chien peut contribuer à réduire son désir de vagabonder et d'explorer, ce qui peut réduire les risques de perte ou de blessure."
  ],
  'title_6': "Informations Générales",
  'description_6': null,
  'list_6': [
    "Les besoins énergétiques du chien : protéines et acides aminés",
    "Les protéines sont essentielles dans l'alimentation des chiens, après l'eau. Elles contribuent à leur croissance, au développement musculaire, à la réparation des tissus corporels et au bon fonctionnement du système immunitaire. Deux acides aminés supplémentaires, la taurine et l'arginine, sont indispensables pour leur santé cardiaque et d'autres fonctions physiologiques. Il est crucial de fournir à votre chien une alimentation équilibrée et riche en protéines pour maintenir sa santé et son bien-être.",
    "Pourquoi donner des fibres à son compagnon poilu ?",
    "Les fibres sont bénéfiques pour la santé digestive des chiens. Elles aident à favoriser le transit intestinal, ce qui est particulièrement utile pour prévenir la formation de boules de poils dans l'estomac. De plus, les fibres peuvent contribuer à la sensation de satiété, ce qui peut aider à maintenir un poids corporel sain. Cependant, étant donné que les chiens sont principalement carnivores, la quantité de fibres dans leur alimentation doit être contrôlée et modérée.",
    "Combien de fois nourrir son chien par jour ?",
    "La fréquence d'alimentation d'un chien dépend de plusieurs facteurs, mais il est généralement recommandé de nourrir un chien adulte deux fois par jour, en respectant la quantité quotidienne recommandée."
  ],
  'advice_lst_title_1': "7 conseils pour bien hydrater son chien",
  'advice_lst_1': [
    "•	Surveillez toujours la gamelle d’eau : elle doit être pleine, propre, avec une eau renouvelée chaque jour. Optez pour un bol, ou, encore mieux, une fontaine, en inox ou en céramique plutôt qu’en plastique, car cela se nettoie mieux et offre de meilleures conditions d’hygiène.",
    "•	Choisissez un bol d’eau d’une taille adaptée à celle de votre chien et surélevé si votre animal est de grand gabarit.",
    "•	L’eau doit se situer dans un endroit facilement accessible pour votre chien et ne pas lui demander d’effort pour aller boire.",
    "•	Donnez des aliments riches en eau et non uniquement des croquettes. Ajoutez de la pâtée complète ou, si votre chien ne la tolère pas, des courgettes cuites ou du concombre, notamment en cas de fortes chaleurs.",
    "•	Si votre chien ne tolère que les croquettes, vous pouvez les réhydrater : ajoutez le poids des croquettes en eau tiède, patientez 15 minutes et servez la gamelle comme d’habitude.",
    "•	Encouragez votre chien à boire, notamment après un exercice, lors d’une randonnée et à chaque fois qu’il fait chaud. Ayez toujours avec vous un bol et une bouteille d’eau pour lui et proposez-lui de boire souvent. Les besoins des chiens augmentent dans ces situations. Si vous mangez au restaurant en compagnie de votre animal, nombreux sont les professionnels à proposer gracieusement un récipient d’eau pour votre toutou. N’hésitez pas à le leur demander.",
    "•	Consultez votre vétérinaire pour connaître les besoins spécifiques de votre toutou, en précisant son mode de vie, dont l’impact sur les besoins d’hydratation n’est pas négligeable. C’est d’autant plus important pour un chiot, comme pour un chien senior ou une chienne allaitante qui peuvent avoir besoin de compléments."
  ],
  'advice_lst_title_2':
      "Pourquoi est-ce si important que votre chien soit bien hydraté ?",
  'advice_lst_2': [
    "•  L’eau joue de nombreux rôles dans l’organisme de votre toutou. En premier lieu, elle participe à maintenir sa température corporelle. En effet, les chiens transpirent par les pattes, notamment au niveau des coussinets. En libérant de l’eau, ils réduisent la chaleur de leur corps. De même, quand ils ont chaud, ils halètent et évacuent ainsi de l’eau pour rééquilibrer leur température. Ils transpirent cependant beaucoup moins que nous, puisque leur peau n’évacue pas l’eau et les électrolytes tels que le chlorure de sodium, comme le fait celle de l’être humain.",
    "•   En outre, l’eau facilite la digestion, car elle joue un rôle dans plusieurs processus digestifs, depuis la bouche (avec la salive), jusqu’à l’estomac. En effet, elle hydrate les aliments ce qui permet leur décomposition puis leur digestion. D’abord, elle les ramollit et leur donne la consistance nécessaire à une bonne assimilation. Ensuite, elle participe à décomposer les aliments en nutriments. Les enzymes digestives y sont dissoutes pour activer les différents nutriments et les rendre absorbables.",
    "•   Enfin, l’eau transporte les nutriments et élimine les déchets. Elle joue un rôle de lubrifiant dans le tube digestif de votre chien et aide les selles à se former, à avoir une bonne consistance pour être évacuées naturellement. Un chien qui manque d’eau peut souffrir de constipation car ses selles seront trop sèches pour pouvoir être éliminées.",
    "•   La quantité d’eau nécessaire au chien dépend de son alimentation. S’il est exclusivement nourri aux croquettes, qui sont très sèches (elles ne contiennent que 8 à 10 % d’eau), il devra boire beaucoup plus que des animaux nourris aux pâtées, car celles-ci contiennent un volume d’eau d’environ 70 à 80 % de leur poids total.",
    "•   Dans tous les cas, il est toujours recommandé de fournir en permanence une bonne gamelle d’eau propre et fraîche à son compagnon à pattes. En raison des divers rôles de l’eau dans son corps, votre toutou peut vite se retrouver en danger s’il souffre de déshydratation.",
  ]
};

final Map<String, dynamic> fishInfo = {
  'type': 'Poissons',
  'bgColor': Colors.orange[700],
  'pic':
      "https://firebasestorage.googleapis.com/v0/b/phoebe-d60af.appspot.com/o/f.png?alt=media&token=675a36fd-bebb-4751-aa41-3a73e3bad897",
  'title_1': "Quels sont les aliments à ne pas donner à un poisson ?",
  'description_1':
      "Les poissons ont des besoins alimentaires spécifiques, et certains aliments peuvent leur être nocifs s'ils sont donnés en excès ou s'ils sont inadaptés à leur régime alimentaire. Voici une liste des aliments à éviter de donner à un poisson",
  'list_1': [
    "•	Aliments humains",
    "Évitez de donner des aliments destinés à la consommation humaine à vos poissons, car ils peuvent contenir des ingrédients inadaptés ou des assaisonnements nocifs. Par exemple, ne donnez pas de pain, de viande, de produits laitiers ou d'autres aliments transformés.",
    "•	Aliments gras",
    "Les poissons ont du mal à digérer les aliments riches en graisses. Évitez donc de leur donner des aliments tels que des morceaux de viande grasse, des restes de nourriture frite ou des aliments en conserve à haute teneur en matières grasses.",
    "•	Aliments sucrés",
    "Les poissons n'ont pas besoin de sucre dans leur alimentation et peuvent avoir du mal à le digérer. Évitez de leur donner des aliments sucrés tels que des bonbons, des biscuits ou des fruits très sucrés.",
    "•	Aliments salés",
    "Les poissons d'eau douce sont sensibles aux niveaux de sel dans leur environnement. Évitez donc de leur donner des aliments salés comme des chips ou des collations salées.",
    "•	Aliments toxiques",
    "Certains aliments peuvent être toxiques pour les poissons. Par exemple, évitez de leur donner des plantes non comestibles ou des aliments contenant des additifs chimiques nocifs.",
    "•	Aliments trop gros",
    "Les poissons ont des bouches relativement petites et peuvent avoir du mal à manger des aliments trop gros pour eux. Assurez-vous de leur donner des aliments adaptés à leur taille et à leur espèce."
  ],
  'title_2': "Informations Générales",
  'description_2': null,
  'list_2': [
    "Les besoins énergétiques du poisson : protéines et acides aminés",
    "Les poissons ont des besoins énergétiques spécifiques en protéines et en acides aminés pour soutenir leur croissance, leur développement et leur santé. Les protéines fournissent une source d'énergie vitale, ainsi que la construction et la réparation des tissus corporels. Les acides aminés essentiels, tels que la lysine et la méthionine, doivent être fournis par l'alimentation car le corps du poisson ne peut pas les synthétiser lui-même en quantités suffisantes. Les besoins en protéines varient selon l'espèce, l'âge, la taille et d'autres facteurs. Assurer une alimentation équilibrée, avec des sources de protéines de haute qualité adaptées à l'espèce, est essentiel pour maintenir la santé et le bien-être des poissons.",
    "Pourquoi donner des fibres à poisson ?",
    "Donner des fibres à votre poisson est essentiel pour maintenir sa santé digestive. Les fibres favorisent le transit intestinal, préviennent les blocages intestinaux et aident à réguler le poids en procurant une sensation de satiété. Elles contribuent également à une alimentation équilibrée et à une meilleure santé générale en fournissant des nutriments essentiels. Choisissez des sources de fibres adaptées aux poissons, comme des légumes feuillus ou des algues, et consultez un spécialiste pour des conseils adaptés à l'espèce de votre poisson.",
    "Combien de fois nourrir son poisson par jour ?",
    "La fréquence de nourrissage des poissons varie en fonction de plusieurs facteurs, mais il est généralement recommandé de nourrir les poissons adultes une à deux fois par jour et de surveiller attentivement leur comportement alimentaire pour ajuster la quantité et la fréquence de nourriture en conséquence."
  ],
  'advice_lst_title_1': "Différents types de poissons et d'aquarium",
  'advice_lst_1': [
    "Avant de se lancer dans l'aquariophilie, mieux vaut bien étudier la question afin de pouvoir choisir les types de poissons et d'aquarium adaptés à votre mode de vie, à votre logement, à votre budget, à votre temps disponible, à vos envies concernant la beauté de certains poissons, etc.",
    "S'agissant de la vie dans l'eau, l'aquariophilie vous imposera de rompre avec vos réflexes habituels de vie dans l'air : un nouveau fonctionnement devra primer. Ne soyez pas inquiet si vous faites des erreurs au début, mais pour votre apprentissage, il sera préconisé de vous lancer avec des espèces peu exigeantes, compatibles entre elles, pas en trop grand nombre, dans un aquarium de taille moyenne, ni trop petit ni trop volumineux.",
    "Les poissons répondent à des conditions de vie propres à chacun (température de l'eau, pH, luminosité, nourriture, solitaires ou en bancs, milieux de vie, etc). Parmi les poissons d'eau douce, vous découvrirez les Barbus, Discus, Guppy, Tétras, Xipho, Cichlidés, carpe Koï, etc. Si vous optez pour les poissons d'eau de mer, alors vous pourrez opter pour le poisson-clown, le gobbie jaune, etc. Crevettes, invertébrés, batraciens, tortues font également partie de l'aquariophilie.",
    "Quant aux plantes, outre leurs attraits décoratifs, elles servent également de lieu de vie pour les poissons et participent à l'oxygénation de l'eau.",
    "N'oublions pas que l'aquarium est un écosystème à respecter et entretenir. Grâce aux dossiers proposés dans cette rubrique, l'aquariophilie n'aura plus de secret pour vous."
  ],
  'title_3': "Quand et Comment changer l'eau de votre aquarium ?",
  'description_3': null,
  'list_3': [
    "Pourquoi est-ce important de changer l'eau ?",
    "•	Maintenir la qualité de l'eau en éliminant les polluants\n•	Prévenir des maladies et bactéries",
    "A quelle fréquence changer l'eau de votre aquarium ?",
    "•	Changements d'eau partiels hebdomadaires\n•	Quand faire un changement d'eau complet d’aquarium ?\n•	Surveiller les paramètres de l'eau pour savoir quand la renouveler",
    "Comment changer l'eau de votre aquarium ?",
    "•	Préparer la nouvelle eau avec un conditionneur d’eau\n•	Éteignez vos équipements : filtres, pompes\n•	Aspirez le gravier et les déchets\n•	Retirez l'eau\n•	Ajoutez votre eau déchlorée\n•	Surveillez vos plantes et poissons"
  ],
  'advice_lst_title_2': "Le comportement normal du poisson",
  'advice_lst_2': [
    "Avant de déceler un éventuel comportement à risque chez vos colocataires à branchies, il est important pour vous de bien connaître votre faune aquatique, en vous rendant compte de leur comportement habituel.",
    "L’attitude normale d’un poisson dépend évidemment des espèces, mais globalement, vous pouvez vous dire qu’un poisson normal",
    "•	a une allure plutôt vive lorsqu’il se balade dans l’aquarium, avec les nageoires déployées. Les espèces évoluant plutôt au fond au niveau du substrat seront très immobiles au contraire, et c’est normal",
    "•	est sociable, il interagit avec ses congénères",
    "•	est curieux et cela se démontre lorsque vous le verrez fouiller le sol et inspecter les plantes et autres décors",
    "•	respire calmement et régulièrement, sans à-coup",
    "•	et ne rechigne pas à se nourrir, au contraire se montre très réactif lorsqu’il s’agit de se délecter de sa nourriture."
  ],
  'advice_lst_title_3': "Détecter les comportements anormaux du poisson",
  'advice_lst_3': [
    "Plusieurs comportements et affections peuvent vous donner la puce à l’oreille, pour identifier un poisson en difficulté ou malade. Passons-les en revue !",
    "•	Comme nos chats et chiens de compagnie, un poisson malade aura tendance à vouloir rester dans son coin pour souffrir en silence. Il va vouloir instinctivement se cacher dans les décors ou se poser au fond, l’air totalement apathique. Comme nous l’avons vu plus tôt, les espèces arpentant les fonds marins ont déjà ce comportement immobile, mais si vous voyez que votre Guppy ou votre poisson combattant se comporte soudainement de la sorte, ce n’est pas normal.",
    "•	Il se nourrira moins, et de ce fait, maigrira rapidement.",
    "•	Un poisson en mauvaise santé n’aura pas un rythme cardiaque de croisière. Il sera essoufflé, vous verrez qu’il respirera très vite et que quelque chose ne va pas.",
    "•	Autrefois habile tel une danseuse étoile, votre poisson se met à nager comme un pied avec ses mouvements désordonnés ? C’est mauvais signe. D’autant plus s’il se met à nager la tête en bas, ou s’il ne parvient plus à aller vers le fond, flottant tout en haut… Cela peut être le signe d’un trouble de la vessie. Vous devrez consulter un professionnel pour qu’il vous indique la marche à suivre.",
    "•	Ce n’est pas la rage, mais c’est tout de même important à noter et à traiter. Si votre poisson a une mousse blanchâtre au niveau de sa bouche, cela est dû à ce qu’on appelle la columnariose. C’est une infection bactérienne qui laisse apparaître des points blancs près de la bouche. Sans surveillance et traitement, ces points blancs évoluent et se condensent en de la mousse laiteuse. Pas très ragoutant…",
    "•	Vous ne pourrez pas les rater. Si vous vous rendez compte que les nageoires de votre poisson sont rongées ou déchiquetées, c’est sûrement l’œuvre d’une vilaine bactérie ou d’un champignon.",
    "•	Une peine de cœur, un habitat qui ne lui convient pas tout à fait, un mauvais paramétrage de l’aquarium, des démangeaisons… Cela fait de bonnes raisons d’être stressé ! Le stress engendre chez votre poisson ce qu’on appelle l’ichthyophthiriose, ou la maladie des points blancs (plus simple à dire quand même). C’est une maladie parasitaire qui laisse apparaître plein de petites taches blanches sur son corps. ",
    "•	Cela peut être impressionnant visuellement ! Si votre petite poiscaille a les yeux qui lui sortent des trous, c’est qu’il est atteint d’exophtalmie. Encore l’œuvre d’infections virales, bactériennes ou fongiques.",
    "•	Si c’est le ventre et les écailles qui sont particulièrement proéminents, alors votre poisson a sûrement attrapé l’hydropisie. C’est une maladie plus compliquée à traiter malheureusement.",
    "•	Enfin plus globalement, si vous observez n’importe quelle modification de son aspect habituel : plaie ouverte, pustule, parasite externe visible, trou… C’est qu’il est temps de s’occuper de l’hygiène de votre aquarium, souvent source de tous les maux !"
  ]
};

final Map<String, dynamic> catInfo = {
  'type': "Chats",
  'bgColor': Colors.blue[500],
  'pic':
      "https://firebasestorage.googleapis.com/v0/b/phoebe-d60af.appspot.com/o/c.png?alt=media&token=c62c8a7a-0273-4923-9cd9-6cc86875033a",
  'title1': "Quels sont les aliments à ne pas donner à un chat ?",
  'description1':
      "Voici une liste de 10 aliments toxiques pour les chats, que vous ne devez surtout pas lui donner, pour préserver son bien-être au maximum et lui éviter de contracter des maladies ",
  'list_1': [
    "•	L’oignon et l'ail",
    "Ces légumes contiennent du thiosulfate, une substance qui peut provoquer une anémie hémolytique chez les chats, c'est-à-dire la destruction des globules rouges.",
    "•	Le chocolat",
    "Le chocolat contient de la théobromine, un alcaloïde qui peut provoquer des troubles du rythme cardiaque, des convulsions et même la mort chez le chat.",
    "•	L'avocat",
    "Toutes les parties de l'avocat contiennent une substance appelée persine, qui peut provoquer des troubles gastro-intestinaux chez les chats.",
    "•	Le raisin et les raisins secs",
    "Ces fruits peuvent provoquer une insuffisance rénale aiguë chez les chats. Les symptômes peuvent inclure une hyperactivité suivie d'une apathie, une anorexie, une diarrhée et une perte de poids.",
    "•	Le café et l'alcool",
    "La caféine et l'alcool peuvent être extrêmement toxiques pour les chats. Ils peuvent provoquer des symptômes tels que l'hyperactivité, les tremblements, les vomissements, les palpitations cardiaques, et même la mort.",
    "•	La noix de macadamia",
    "Les chats qui consomment des noix de macadamia peuvent présenter des symptômes tels que la faiblesse, l'hyperthermie, les vomissements, les tremblements, les douleurs abdominales et la léthargie.",
    "•	Les aliments salés",
    "Une consommation excessive de sel peut provoquer une intoxication chez le chat. Les symptômes peuvent inclure une soif excessive, une miction accrue, des vomissements, de la diarrhée, une température corporelle élevée et des convulsions.",
    "•	Les aliments sucrés",
    "L'excès de sucre peut provoquer l'obésité, les problèmes dentaires et le diabète chez les chats car l'édulcorant artificiel xylitol, présent dans de nombreux produits sans sucre, est très toxique pour les chats.",
    "•	Le saumon fumé",
    "Évitez de donner du saumon fumé à un votre boule de poils car ce type d’aliment est ultra salé ou gras qui peuvent créer problèmes rénaux chez nos amis félins.",
    "•	Les produits laitiers",
    "Beaucoup de gens pensent qu'il est parfaitement acceptable de donner du lait à un chat alors beaucoup sont intolérants au lactose. Cela signifie qu'il peut entraîner des troubles digestifs tels que des diarrhées ou des vomissements."
  ],
  'title_2': "Quel type d’alimentation faut-il donner à son félin ?",
  'description_2':
      "L'alimentation d'un chat domestique est un mélange complexe qui peut varier en fonction des préférences individuelles, des besoins nutritionnels et de l'état de santé de l'animal. Cette alimentation peut se composer de plusieurs types de nourriture, dont les croquettes, la nourriture humide (comme la pâtée), les friandises, et dans certains cas, des fruits et des légumes (qu’il faut très souvent, donner avec parcimonie).",
  'list_2': [
    "•	Les croquettes",
    "Les croquettes, ou nourriture sèche, sont la solution la plus populaire pour de nombreux propriétaires de chats. Elles sont faciles à stocker et à servir, et peuvent être laissées à disposition de votre chat tout au long de la journée sans risque de se gâter.",
    "•	La nourriture humide",
    "La nourriture humide, ou pâtée, est généralement très appréciée des chats en raison de sa texture et de son arôme. Elle présente une teneur en eau élevée, ce qui peut contribuer à une bonne hydratation, en particulier pour les chats qui ne boivent pas beaucoup d'eau.",
    "•	Les friandises",
    "Les friandises pour chats sont souvent utilisées comme un outil de renforcement positif. Les friandises sont généralement riches en calories et en gras.",
    "•	Fruits et légumes",
    "Bien que les chats soient des vrais carnivores et qu’ils aient besoin de protéines animales pour survivre, certains fruits et légumes sont excellents pour eux. Ils peuvent fournir vitamines, minéraux, fibres alimentaires et peuvent effectivement être ajoutés à leur alimentation comme compléments."
  ],
  'title_3': "Informations Générales",
  'description_3': null,
  'list_3': [
    "Les besoins énergétiques du chat : protéines et acides aminés",
    "Les protéines sont essentielles dans l'alimentation des chats, après l'eau. Leurs besoins en protéines sont deux fois plus élevés que ceux des chiens, car elles contribuent à leur croissance, au développement, à la réparation des tissus corporels, ainsi qu'à la production d'hormones et d'enzymes. Deux acides aminés supplémentaires, la taurine et l'arginine, sont indispensables pour les chats et se trouvent uniquement dans les produits d'origine animale.",
    "Pourquoi donner des fibres à son compagnon poilu ?",
    "Les fibres, souvent négligées dans l'alimentation du chat, sont pourtant utiles à sa santé digestive. Les chats, en se léchant, avalent leurs poils, ce qui peut causer la formation de boules de poils dans leur estomac. L'inclusion de fibres dans leur alimentation aide à favoriser le transit intestinal, contribuant ainsi à l'élimination de ces boules de poils .De plus, les fibres peuvent donner une sensation de satiété, aidant à maintenir un poids sain. Cependant, les chats étant essentiellement carnivores, la quantité de fibres dans leur régime doit être modérée.",
    "Combien de fois nourrir son chat par jour ?",
    "La fréquence d'alimentation d'un chat dépend de plusieurs facteurs, mais il est généralement recommandé de nourrir un chat adulte deux fois par jour, en respectant la ration quotidienne recommandée.",
    "Comment hydrater un chat malade ?",
    "Lorsqu’un chat est souffrant, il peut connaître des difficultés pour boire et manger. Pour le faire boire, le biberon ou la seringue seront vos alliés. Même malade votre petit félidé peut stresser devant la seringue et mordre ou griffer.",
    "Quels sont les symptômes de la déshydratation chez le chat ?",
    "Notre rôle de propriétaire aimant est de subvenir aux besoins de nos animaux de compagnie et de vérifier régulièrement leur état de santé. Lorsque nous faisons le choix de nourrir le félin à l’aide d’une alimentation sèche, nous devons veiller à leur apport hydrique. Pour savoir si votre chat boit suffisamment, il suffit de surveiller différents signes.",
    "Que faire si mon chat boit trop ?",
    "Si votre matou boit plus que de raison, on parle de polydipsie. Plusieurs raisons médicales peuvent inciter le chat à boire plus de 100 ml d’eau par kg de poids et par jour. Différentes maladies peuvent être responsables de cette sur hydratation : une potomanie, un diabète ou une insuffisance rénale. Dans tous les cas, si votre chat auparavant dédaigneux de son bol d’eau en devient fou, prenez rendez-vous chez votre vétérinaire habituel. Il pratiquera les examens nécessaires et proposera le traitement adapté pour votre compagnon félin."
  ],
  'advice_lst_title_1':
      "Comment aider votre chat à bien s’hydrater tout au long de sa vie ?",
  'advice_lst_1': [
    "Différentes raisons peuvent expliquer le refus du chat de boire. Des affections comme une gingivite, une infection urinaire ou un début d’anorexie font que le mistigri va délaisser sa gamelle d’eau. La propreté de sa gamelle, sa forme et une eau au goût trop prononcée peuvent aussi en être la cause. Lorsque votre matou fait la fine bouche alors que tout va bien et que vous nettoyez sa gamelle à chaque changement d’eau, il est temps de trouver d’autres astuces pour l’aider à boire de l’eau, particulièrement si vous le nourrissez exclusivement de croquettes.",
    "Les conséquences d’une mauvaise hydratation sur la santé du chat",
    "Lorsque l’animal ne s’hydrate pas correctement, il provoque un stress dans son organisme et ouvre la voie à différentes pathologies:",
    "•	Maladies ou insuffisance rénale\n•	Hyperthyroïdie\n•	Diabète",
    "Nos petits buveurs ne ressentent pas la soif et il est souvent difficile de les inciter à boire lorsqu’ils sont malades ou par forte chaleur. Pourtant, une bonne hydratation demeure indispensable à leur bien-être et leur santé. Cet élément joue un rôle capital dans:",
    "•	La circulation sanguine\n•	Le maintien et la régulation de leur température\n•	L’élimination des déchets par l’urée\n•	Le transport, la digestion et l’absorption des nutriments et des vitamines"
  ],
  'advice_lst_title_2': "Les vaccins de mon chat ",
  'advice_lst_2': [
    "Le chaton peut être vacciné contre plusieurs maladies graves, mais heureusement, plusieurs vaccins peuvent être pratiqués simultanément.",
    "•	Leucose féline (à l'origine d'une immunodéficience et de tumeurs) : une injection vers 8-9 semaines, avec un rappel à 12 semaines.",
    '•	Panleucopénie infectieuse féline ou "typhus du chat" : une injection vers 8-9 semaines, avec un rappel à 12 semaines.',
    "•	Coryza (qui peut entraîner des troubles respiratoires chroniques à vie) : une injection vers 8-9 semaines, avec un rappel à 12 semaines.",
    "•	Chlamydiose (affection bactérienne à l'origine de troubles oculaires et respiratoires) : une injection vers 8-9 semaines, avec un rappel à 12 semaines.",
    "•	Rage : la vaccination n'est possible qu'à partir de l'âge de 3 mois (idéalement entre 12 et 16 semaines)."
  ],
  'title_4': "Les traitements antiparasitaires de votre chat",
  'description_4':
      "Les traitements antiparasitaires sont essentiels pour protéger votre chat contre les parasites externes (comme les puces et les tiques) et internes (comme les vers intestinaux). Voici un aperçu des principaux traitements antiparasitaires pour les chats ",
  'list_4': [
    "•	Antipuces topiques",
    "Ces traitements sont appliqués sur la peau du chat, généralement entre les omoplates, et offrent une protection contre les puces pendant plusieurs semaines. Ils agissent en tuant les puces adultes et en empêchant le développement des œufs et des larves.",
    "•	Antipuces oraux",
    "Certains médicaments sont administrés par voie orale et agissent pour tuer les puces après qu'elles ont mordu le chat. Ces comprimés offrent une protection rapide et peuvent durer jusqu'à plusieurs mois.",
    "•	Anti-tiques",
    "Certains traitements antiparasitaires sont efficaces contre les tiques en plus des puces. Ils peuvent être administrés sous forme de pipettes topiques ou de colliers qui repoussent et tuent les tiques.",
    "•	Antiparasitaires à large spectre",
    "Certains médicaments sont conçus pour traiter à la fois les parasites internes et externes, offrant une protection complète contre une gamme de parasites tels que les puces, les tiques, les vers intestinaux et les acariens.",
    "•	Traitements vermifuges",
    "Ces médicaments sont utilisés pour traiter les vers intestinaux chez les chats. Ils sont généralement administrés sous forme de comprimés ou de pâtes orales et doivent être administrés régulièrement selon les recommandations de votre vétérinaire."
  ],
  'title_5': "Comment je protège mon chat ?",
  'description_5':
      "L'identification et la sécurité sont des aspects cruciaux de la vie de votre chat, garantissant son bien-être et sa protection en cas de perte ou de danger. Voici quelques mesures importantes à prendre",
  'list_5': [
    "•	Collier avec médaille d'identification",
    "Équiper votre chat d'un collier avec une médaille d'identification contenant vos coordonnées (nom, numéro de téléphone) peut être une mesure supplémentaire de sécurité. Cela permet à quiconque trouve votre chat de vous contacter facilement.",
    "•	Gardez votre chat à l'intérieur",
    "Maintenir votre chat à l'intérieur réduit considérablement les risques de perte, de vol ou de blessures dues à des accidents ou à des prédateurs extérieurs. Si votre chat sort à l'extérieur, assurez-vous qu'il porte un collier d'identification et qu'il est stérilisé pour éviter la reproduction non contrôlée.",
    "•	Stérilisation/castration",
    "En plus de contrôler la population féline, la stérilisation ou la castration de votre chat peut contribuer à réduire son désir de vagabonder et d'explorer, ce qui peut réduire les risques de perte ou de blessure."
  ]
};
