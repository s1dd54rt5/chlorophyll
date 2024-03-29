import 'dart:convert';

import 'package:path/path.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

List<Map<String, String>> diseases = [
  {
    "id": "Tomato___Bacterial_spot",
    "name": "Tomato Bacterial Spot",
    "remedy":
        "One of the best ways to avoid bringing bacterial spot into the garden is to purchase certified disease-free tomato seeds. Also, gardeners should always use either a sterilized soil medium or one that is commercially made. If purchasing disease-free tomato seeds is not an option, it is important to try to sterilize the seeds as best you can, eliminating any bacteria that may exist on the seed’s surface and interior. To do this, fully submerge your tomato seeds in 1.3% sodium hypochlorite for one minute. A slightly more risky technique exists which could affect germination but helps to sterilize both the outer surface and interior of the tomato seed by submerging the seeds in 122 degree F water for 25 minutes. Practicing crop rotation will help lessen the spread of bacterial spot. Because moist conditions and humidity attract bacterial spot, watering should be done in the early morning hours to allow plants plenty of time to dry out before the afternoon heat comes along. Gardeners should also be careful not to give their tomato plants too much water, and should try to keep leaves dry when watering their plants, focusing on watering the soil instead of the plant itself. Drip irrigation is recommended over standard overhead watering techniques."
  },
  {
    "id": "Tomato___Early_blight",
    "name": "Tomato Early Blight",
    "remedy":
        "1. Plant resistant varieties. Varieties such as ‘Early Cascade’, ‘Floramerica’, ‘Jetstar’, ‘Manlucie’, ‘Supersonic’, and ‘Surecrop’ have some tolerance to early blight. These varieties will require a less intensive management program than susceptible varieties.\n2. Maintain plant vigor. Stressed plants are more susceptible to early blight. Water the plants regularly, but don't fertilize until the plants are well-established and in full blossom. Do not mulch until the soil is warm. \n3. Do a thorough cleanup of the garden in the fall. Remove plant debris or till it into the soil. Pull weeds that compete for light, water, and nutrients, especially nightshade, horse nettle, and other weeds in the tomato family. \n4. Rotate crops. Practice a 2- or 3-year crop rotation. Avoid planting eggplant or potatoes where tomatoes were last planted. \n5. Avoid activity when plants are wet. Confine staking and picking to times when foliage is dry. Disease is more readily spread when plant foliage is wet",
  },
  {
    "id": "Tomato___Late_blight",
    "name": "Tomato Late Blight",
    "remedy":
        "Use of integrated management practices is necessary for successful suppression of potato or tomato late blight. In the absence of sexual reproduction P. infestans requires a living host to survive between seasons. Therefore, sanitation (elimination or exclusion of infected plant parts from a farm) is important in the overall management strategy. Ideally, no infected potatoes should be present in the vicinity of the crop. Volunteer plants that might be infected should be destroyed. Cull potatoes should be frozen, crushed, fed to livestock, or buried under at least 2 feet of soil. Only tubers that are free of P. infestans should be planted. The Certified grade for seed potatoes allows up to 1 percent late blight infection. Growers should request information from the seed potato producer as to whether late blight was observed during field or harvest inspections. After planting, additional precautions will reduce the chances of successful inoculations and can suppress development and reproduction of the pathogen. Using resistant cultivars (Figure 17) will reduce the chances of infection and slow the pathogen growth rate if some infections develop. Early in the season, the lowest labeled rate of protectant fungicide will provide protection and thus prevent a rapid epidemic. Fungicide should be applied either at an appropriate regular interval for the production area or adjusted on the basis of weather. Several forecasting systems that identify favorable weather conditions are available (e.g., Blitecast, Tomcast) and can be used to adjust the intensity of scouting as well as the frequency of fungicide applications. Hilling of potatoes increases the amount of soil between tubers and the soil surface and thus helps protect tubers from sporangia that land on the soil surface. Scouting. Regular inspections of growing crops are important to the overall management of late blight. Because topography and crop growth can influence the microclimate encountered by the pathogen, late blight may be detectable earlier in some areas than in others. It is likely to appear first in wet areas (low spots in the field, areas adjacent to woods and hedgerows, dense crops, or areas adjacent to other features that might shade crops), especially when the macroclimate has been less than optimal for pathogen development. Protectant fungicides are often needed from mid- to late season when plants are growing actively and have a dense canopy. Applications should be repeated regularly to replace fungicide that has been washed or abraded away and to protect foliage produced since the last application. It is during this time that the more effective fungicides are needed. (Consult current Cooperative Extension recommendations for specific information.) Applications should be more frequent during weather that is favorable to late blight (wet with moderate temperatures) than in unfavorable weather (dry foliage and very cool [<50°F] or very hot temperatures).",
  },
  {
    "id": "Tomato___Leaf_Mold",
    "name": "Tomato Leaf Mold",
    "remedy":
        "Applications should be made prior to infection when environmental conditions favor disease to be the most effective. The first leaf mold infections of the season have been observed in the first week of June in Minnesota high tunnel tomatoes. Fungicide applications should be repeated according to label instructions. It is important to alternate between different chemical families to avoid the development of pathogen resistance to particular active ingredients. Although varieties designated as resistant to leaf mold can be found in many seed catalogs, these may or may not be effective in reducing disease in Minnesota. Resistant varieties should be used in combination with cultural control practices as part of an integrated disease management program.",
  },
  {
    "id": "Tomato___Septoria_leaf_spot",
    "name": "Tomato Septoria Leaf Spot",
    "remedy":
        "1. Remove diseased leaves. If caught early, the lower infected leaves can be removed and burned or destroyed. However, removing leaves above where fruit has formed will weaken the plant and expose fruit to sunscald. At the end of the season, collect all foliage from infected plants and dispose of or bury. Do not compost diseased plants. \n2. Improve air circulation around the plants. If the plants can still be handled without breaking them, stake or cage the plants to raise them off the ground and promote faster drying of the foliage. \n3. Mulch around the base of the plants. Mulching will reduce splashing soil, which may contain fungal spores associated with debris. Apply mulch after the soil has warmed. \n4. Do not use overhead watering. Overhead watering facilitates infection and spreads the disease. Use a soaker hose at the base of the plant to keep the foliage dry. Water early in the day. \n5. Control weeds. Nightshade and horsenettle are frequently hosts of Septoria leaf spot and should be eradicated around the garden site.",
  },
  {
    "id": "Tomato___Spider_mites Two-spotted_spider_mite",
    "name": "Tomato Spider Mite",
    "remedy":
        "Watch for spider mites in greenhouses where vegetable transplants are growing. Also scout eggplants in the field. Checking for mites must be done by examining foliage. Adult mites are not found on sticky cards. Mites often develop as localized infestations on particular groups of plants such as beans or tomatoes. Sample plants by turning over leaves and with a hands-free magnifier (Optivisor) or hand lens, check for the presence of spider mites as well as symptoms or webbing. Adult females are approximately 1/50-inch long, slightly orange or pale green in color with two dark spots on their body. All mobile stages are able to pierce plant tissue with their mouth-parts and remove plant fluids. Saliva injected during feeding may also cause discoloration, necrosis or abnormalities on leaves, stems and fruits. Most spider mites are found on the underside of leaves. A 10X hand lens is key for identifying the mite species, but injury, webbing, and the tiny adults can be seen with the naked eye. Preventative releases of the predatory mite, Phytoseiulus persimilis, may suppress TSSM populations in greenhousese and vegetable fields, as they do in strawberry fields. Amblyseius fallicis is a predatory mite that is widely used in greenhouses. See New England Vegetable Guide on biological control in greenhouse bedding plants, Table 25. Scouting guidelines and biological control options for bedding plants",
  },
  {
    "id": "Tomato___Target_Spot",
    "name": "Tomato Target Spot",
    "remedy":
        "Cultural practices for target spot management include improving airflow through the canopy by wider plant spacing and avoiding over-fertilizing with nitrogen, which can cause overly lush canopy formation. Pruning suckers and older leaves in the lower canopy can also increase airflow and reduce leaf wetness.1,5,9 Avoid planting tomatoes near old plantings. Inspect seedlings for target spot symptoms before transplanting. Manage weeds, which may serve as alternate hosts, and avoid the use of overhead irrigation. Destroy crop residues shortly after the final harvest, and rotate away from tomato and other known hosts for at least three years. Resistance to target spot is not available in commercial tomato varieties, although partial resistance has been observed in wild species of tomato. The primary strategy used to manage target spot on tomato is the regular application of fungicides. Applications should begin before symptoms appear when conditions are favorable for infection and disease development. Fungicides may need to be applied at regular intervals (every 10 to 14 days is common) depending on the label directions of the products used. Full coverage of all plant surfaces is needed for the best control of target spot",
  },
  {
    "id": "Tomato___Tomato_Yellow_Leaf_Curl_Virus",
    "name": "Tomato Yellow Leaf Curl Virus",
    "remedy":
        "Sanitation is very important for preventing the migration of whitefly adults and the spread of TYLCV. Rogue tomato or pepper plants with early symptoms of TYLCV can be removed from fields by placing infected-looking plants in plastic bags immediately at the beginning season, especially during first three to four weeks. Maintain good weed control in the field and surrounding areas. Prevent the spread of any whiteflies to healthy plants. Tomato and pepper fields should be cleaned up immediately after harvest. Also destroy crop residues of melons and cotton immediately after harvest to reduce whitefly migration.",
  },
  {
    "id": "Tomato___Tomato_mosaic_virus",
    "name": "Tomato Mosaic Virus",
    "remedy":
        "Use certified disease-free seed or treat your own seed. Soak seeds in a 10% solution of trisodium phosphate (Na3PO4) for at least 15 minutes. Or heat dry seeds to 158 °F and hold them at that temperature for two to four days. Purchase transplants only from reputable sources. Ask about the sanitation procedures they use to prevent disease. Inspect transplants prior to purchase. Choose only transplants showing no clear symptoms. Avoid planting in fields where tomato root debris is present, as the virus can survive long-term in roots. Wash hands with soap and water before and during the handling of plants to reduce potential spread between plants. Disinfect tools regularly — ideally between each plant, as plants can be infected before showing obvious symptoms. Soaking tools for 1 minute in a 1:9 dilution of germicidal bleach is highly effective. Or a 1-minute soak in a 20% weight/volume solution of nonfat dry milk and water is also very effective. When pruning plants, have two pruners and alternate between them to allow proper soaking time between plants. Avoid using tobacco products around tomato plants, and wash hands after using tobacco products and before working with the plants. Tobacco in cigarettes and other tobacco products may be infected with either ToMV or TMV, both of which could spread to the tomato plants. Scout plants regularly. If plants displaying symptoms of ToMV or TMV are found, remove the entire plant (including roots), bag the plant, and send it to the University of Minnesota Plant Diagnostic Clinic for diagnosis.",
  },
];

Future<Map> uploadImage(File imageFile) async {
  var stream = new http.ByteStream(imageFile.openRead());
  stream.cast();
  var length = await imageFile.length();
  var uri = Uri.parse("http://c3cf-35-245-170-252.ngrok.io/upload");
  var request = new http.MultipartRequest('POST', uri);
  var multiPartFile = new http.MultipartFile(
    'file',
    stream,
    length,
    filename: basename(imageFile.path),
  );
  request.files.add(multiPartFile);
  // return diseases[2];
  var response = await request.send();
  if (response.statusCode == 200) {
    final respStr = await response.stream.bytesToString();
    Map res = jsonDecode(respStr);
    for (var disease in diseases) {
      if (disease["id"] == res["result"]) {
        return disease;
      }
    }
    return {
      "id": "No Disease",
      "name": "No diseases!",
      "remedy": "Your plant is healthy!",
    };
  }
  return {
    "id": "Error",
    "name": "Tomato Septoria Leaf Spot",
    "remedy":
        "1. Remove diseased leaves. If caught early, the lower infected leaves can be removed and burned or destroyed. However, removing leaves above where fruit has formed will weaken the plant and expose fruit to sunscald. At the end of the season, collect all foliage from infected plants and dispose of or bury. Do not compost diseased plants. \n2. Improve air circulation around the plants. If the plants can still be handled without breaking them, stake or cage the plants to raise them off the ground and promote faster drying of the foliage. \n3. Mulch around the base of the plants. Mulching will reduce splashing soil, which may contain fungal spores associated with debris. Apply mulch after the soil has warmed. \n4. Do not use overhead watering. Overhead watering facilitates infection and spreads the disease. Use a soaker hose at the base of the plant to keep the foliage dry. Water early in the day. \n5. Control weeds. Nightshade and horsenettle are frequently hosts of Septoria leaf spot and should be eradicated around the garden site.",
  };
}
