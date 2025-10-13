

 Internal Internship – Week II

Ky repo shërben vetëm për ngarkimin e detyrave të javës së dytë nga çdo praktikant në branch-in e vet.

> ⚠️ Rregulli i artë: *Mos shto asgjë në `main`.* Nëse provoni që të shtoni diçka ne 'main', atëherë ju bëni një 'pull request', që më pas do t'ju refuzohet nga ana jonë, ose çdo gjë që futet në `main` fshihet automatikisht nga një GitHub Action. Puno vetëm në branch-in tënd.

 1) Struktura e kërkuar

Çdo student ka një branch me emrin e vet dhe brenda saj ka nga një folder për çdo ditë:


(branch-i jot: EmriMbiemri)
├─ Day1/
│  ├─ Task1.dart
│  └─ Task2.dart
├─ Day2/
│  ├─ Task1.dart
│  └─ Task2.dart
├─ Day3/
├─ Day4/
└─ Day5/


* Emri i branch-it: EmriMbiemri (pa hapësira, p.sh. `EnionIsmaili`)
* Emri i folderit ditor: DayX (p.sh. `Day1`, `Day2`, …)
* Emri i fajllit: TaskX.dart (p.sh. `Task1.dart`, `Task2.dart`)


 2) Krijo branch-in tënd 

1. Hape faqen e repo-s.
2. Lart majtas, kliko te Branch: main (butoni i degëve).
3. Në kutinë e kërkimit, shkruaj EmriMbiemri (p.sh. `EnionIsmaili`).
4. Zgjidh opsionin Create branch: EmriMbiemri from ‘main’.
5. Sigurohu që je tani në branch-in tënd (duhet të shfaqet `Branch: EmriMbiemri`).


 3) Ngarko detyrat çdo ditë

1. Sigurohu që je në branch-in tënd (Branch: EmriMbiemri).
2. Kliko Add file → Create new file ose Upload files.
3. Nëse nuk ekziston folderi i ditës, krijo një të ri duke shkruar emrin e skedarit me path, p.sh.:

   * `Day1/Task1.dart` dhe pastaj Commit changes
   * përsërite për `Day1/Task2.dart`, pastaj për `Day2/Task1.dart`, etj.
4. Te Commit changes zgjidh Commit directly to the `EmriMbiemri` branch.
5. Vendos një mesazh të shkurtër p.sh. `Day1: shtoj Task1 dhe Task2` → Commit changes.

> Shembull emërtimi:
>
> * Dita: `Day1`, `Day2`, …
> * Detyra: `Task1.<ext>`, `Task2.<ext>` (p.sh. `Task1.dart`, `Task2.kt`, `Task3.py`)



 4) Rregullat e emërtimit & komunikimit

* Dega: `EmriMbiemri` (shembull: `EnionIsmaili`)
* Dita: `Day1` … `Day5`
* Detyra: `Task1.<ext>`, `Task2.<ext>` …
* Mesazhet e commit-it: `DayX: përshkrim i shkurtër`
  *(shembull: `Day3: përfundoj Task1 (loops)`)*



 5) Çfarë nuk duhet bërë

* ❌ Mos krijo/ndrysho asgjë në `main`.
* ❌ Mos hap Pull Request drejt `main` (nëse nuk kërkohet shprehimisht).
* ❌ Mos përdor emra të tjerë degësh ose folderash — respekto formatin.

> ℹ️ Nëse gabimisht shton diçka në `main`, GitHub Action-i i repo-s do ta fshijë automatikisht. Rifillo punën në degën tënde.



 6) Pyetje të mundshme apo ndihmë

Nuk po e gjej degën time në listë.
– Kliko te butoni i degëve → shkruaj emrin tënd → Create branch from ‘main’.

Si t’i bëj update fajllat e mëparshëm?
– Qëndro në degën tënde, hap fajllin, Edit → Commit directly to `EmriMbiemri`.

A shoh dot detyrat e tjerëve?
– Po, duke kaluar te degët e tyre (read-only). Detyrat e tua mbeten në degën tënde.



Suksese dhe punë të mbarë! 🚀
