core_font_register.py
=====================

Abstract
^^^^^^^^

No available documentation script.


------

Launch the example
^^^^^^^^^^^^^^^^^^

  $ python core_font_register.py

------


Code
^^^^


.. code-block:: python

  
  import os
  
  from OCC.Display.SimpleGui import init_display
  from OCC.Core.Addons import text_to_brep, register_font, Font_FA_Bold, Font_FA_Regular
  
  display, start_display, add_menu, add_function_to_menu = init_display()
  
  # register the Respective font
  register_font(os.path.join('.', 'fonts', 'Respective.ttf'))
  
  # text
  # Poetry from Paul Verlaine, Chanson d'Automne
  text = """Les sanglots longs
  Des violons
  De l'automne
  Blessent mon cœur
  D'une langueur monotone
  
  Tout suffocant
  Et blême, quand
  Sonne l'heure,
  Je me souviens
  Des jours anciens
  Et je pleure
  
  Et je m'en vais
  Au vent mauvais
  Qui m'emporte
  Deçà, delà,
  Pareil à la
  Feuille morte."""
  ## create a basic string
  arialbold_brep_string = text_to_brep(text, "Respective", Font_FA_Regular, 12., True)
  
  ## Then display the string
  display.DisplayColoredShape(arialbold_brep_string, color= 'WHITE',update=True)
  
  start_display()

Screenshots
^^^^^^^^^^^


  .. image:: images/screenshots/capture-core_font_register-1-1511701746.jpeg

