import 'dart:io';

void main() {
  int counter = 0;
  String text = "Përshëndetje";
  bool running = true;

  print("🌟 Mirësevini në programin interaktiv!");

  while (running) {
    print("\n-----------------------------------");
    print("📌 Statusi aktual:");
    print("Numëruesi: $counter");
    print("Teksti: $text");
    print("-----------------------------------");
    
    print("Zgjidh një opsion:");
    print("1️⃣ Ndrysho tekstin");
    print("2️⃣ Rrit numëruesin");
    print("0️⃣ Dil nga programi");

    String? input = stdin.readLineSync();

    // Kontroll input për ERR_OUT_OF_RANGE
    if (input == null || input.isEmpty) {
      print("⚠️ Ju lutem, shtypni një opsion të vlefshëm (1, 2 ose 0).");
      continue;
    }

    switch (input) {
      case "1":
        if (text == "Përshëndetje") {
          text = "U përditësua!";
        } else {
          text = "Përshëndetje";
        }
        print("📝 SnackBar: Teksti u ndryshua: $text");
        break;

      case "2":
        counter++;
        print("📝 SnackBar: Numëruesi u rrit: $counter");
        break;

      case "0":
        running = false;
        print("👋 Po dalim nga programi. Faleminderit që e përdoret!");
        break;

      default:
        print("⚠️ Opsion i pavlefshëm. Shtyp 1, 2 ose 0.");
    }
  }

  print("✅ Programi u mbyll me sukses.");
}
