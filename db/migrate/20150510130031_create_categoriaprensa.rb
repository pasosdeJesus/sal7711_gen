class CreateCategoriaprensa < ActiveRecord::Migration[4.2]
  def up
    create_table :sal7711_gen_categoriaprensa do |t|
      t.string :codigo, limit: 15
      t.string :nombre, limit: 500
      t.string :observaciones, limit: 5000
      t.date :fechacreacion
      t.date :fechadeshabilitacion
      t.datetime :created_at, null: false
      t.datetime :updated_at
    end

    execute <<-SQL
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('3', 'A11', 'Iglesias ante el cambio social, los conflictos sociales y la política.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('4', 'A12', 'Iglesia ante el Estado.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('7', 'BA11', 'Sistema y régimen político: Constitución.  Bicentenario.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('8', 'BA12', 'Centralización y descentralización.  ', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('9', 'BA13', 'Ordenamiento territorial. POT.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('10', 'BA14', 'Creación de dependencias públicas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('11', 'BA15', 'Reformas administrativas.  Reestructuración del estado, concursos por méritos, privatización. Comisión Nacional del Servicio Civil.  Tramitomanía.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('12', 'BA16', 'Transferencias municipales, Sistema general de participación, impuestos, financiación territorial. Ley 550. Regalías.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('13', 'BA17', 'Ajustes fiscales , deuda externa, sistema tributario', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('15', 'B21', 'Asuntos administrativos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('16', 'B22', 'Proyectos legislativos. Otros Congreso.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('17', 'B23', 'Sanción de leyes / reglamentación.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('18', 'B24', 'Interpretación legislativa.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('19', 'B25', 'Reformas legislativas/"micos".', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('20', 'B26', 'Conceptos Corte Constitucional.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('22', 'B31', 'Presidencia: política nacional e internacional. Vicepresidencia, Cancillería.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('23', 'B32', 'Ministerios. Dirección de Defensoría Jurídica del Estado. Ministerio del interior. Unidad Nacional de Protección.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('24', 'B33', 'Consejerías, CONPES.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('25', 'B34', 'Departamento administrativo, DANE', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('26', 'B35', 'Departamento Nacional de Planeación, Política social, Gasto Social, Consejo Nacional de Planeación. Gasto público.  Minhacienda.  ', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('27', 'B36', 'Dependencias del Ejecutivo y acciones.  Banco de la República.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('28', 'B37', 'ECOPETROL, OXI, política petrolera, minería, hidrocarburos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('29', 'B38', 'Consejo superior de política fiscal.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('30', 'B39', 'Relaciones Internacionales: TLC, CAN, APTDEA, ALCA, MERCOSUR.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('32', 'B41', 'Administración departamental: Gobernaciones, Asambleas. Fábricas de licores. Loterías.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('33', 'B42', 'Administración municipal: Alcaldías, Concejos, conflictos limítrofes, JAC.  Cámaras de Comercio. Movilidad.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('34', 'B43', 'Relaciones autoridades locales. Distritos, zonas metropolitanas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('35', 'B44', 'Desarrollo, megaproyectos. Puertos, aeropuertos, infraestructura. INCO.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('36', 'B45', 'CAR, Centros Administrativos Regionales.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('37', 'B46', 'Asociaciones y corporaciones de departamentos, provincias, regiones y municipios.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('39', 'B51', 'Política anticorrupción, legislación.  Contaduría. Informes.  ', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('40', 'B52', 'Ineficiencias, irregularidades en contratación pública, celebración indebida de contratos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('41', 'B53', 'Problemas de competencia administrativa, nóminas paralelas, tráfico de influencias. Concusión.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('42', 'B54', 'Peculados, fraudes, prevaricato, falsedad en documento público, evasión de impuestos. Cohecho.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('44', 'B61', 'Alcaldía Mayor. Administración, Contraloría, STT (Movilidad), Personería.  Secretarías.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('45', 'B62', 'Alcaldías locales.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('46', 'B63', 'Concejo de Bogotá.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('47', 'B64', 'Dependencias de la administración.  (JAL, JAC, UAESP, IDRD, CADE)', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('48', 'B65', 'Seguridad ciudadana, milicias urbanas, bandas y pandillas, pactos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('50', 'B71', 'Fiscalía ­ CTI. Sistema acusatorio, justicia oral. Código de procedimiento penal.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('51', 'B72', 'Consejo Superior de la Judicatura, jueces de paz. Ley de pequeñas causas, ley de adolescentes. Informes, reforma a la justicia. Minjusticia.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('52', 'B73', 'Corte Suprema de Justicia. Justicia especializada. Justicia en municipios y departamentos, Código penal.  Comisarías de familia.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('53', 'B74', 'Cárceles/INPEC: Política, legislación, protestas de reclusos', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('54', 'B75', 'Tutelas. Acciones de cumplimiento.  Derecho de petición', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('55', 'B76', 'Consejo de Estado. Acción de Cumplimiento. Justicia administrativa.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('56', 'B77', 'Jurisdicciones Especiales: Indígena, Paz.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('57', 'B78', 'Métodos alternativos de solución de conflictos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('59', 'B81', 'Contraloría. Auditoria general de la nación. Contaduría general. Notariado y registro. Oficina de Registro de Instrumentos Públicos. Zar anticorrupción.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('60', 'B82', 'Procuraduría.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('61', 'B83', 'Defensoría del Pueblo.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('62', 'B84', 'Personería.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('63', 'B85', 'Veeduría. Transparencia por Colombia', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('64', 'B86', 'DIAN. Control a convenios nacionales e internacionales', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('66', 'B91', 'Fuerzas Militares, Ministerio de Defensa Nacional, justicia penal militar, GAULA', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('67', 'B92', 'Policía Nacional, DAS, ESMAD, DIJIN, Convivir, cooperativas de seguridad.  Informes de Medicina Legal.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('68', 'B93', 'Política de seguridad democrática.  Recompensas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('70', 'B101', 'Partidos políticos. Otros partidos no de izquierda. Clientelismo.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('71', 'B102', 'Partido Liberal. Uribismo.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('72', 'B103', 'Partido Conservador.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('73', 'B104', 'M-19.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('74', 'B105', 'Unión Patriótica.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('75', 'B106', 'Partido Comunista.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('76', 'B107', 'Polo Democrático. Otros grupos y movimientos políticos de izquierda.  Estatuto de oposición.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('78', 'B111', 'Diálogos y negociaciones de paz, acuerdos humanitarios, canje. Comisión nacional de reconciliación, políticas de desmovilización, antisecuestro.  Reinserción, indulto. Exsecuestrados.  Parapolítica. Farcpolítica.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('79', 'B112', 'Acciones por la paz y contra la violencia, diálogos regionales. Desminado.  Programa de Desarrollo y Paz.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('80', 'B113', 'Derecho Internacional Humanitario. TIO, TPI, CPI, CIRC, CIDH.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('81', 'B114', 'Organizaciones de DDHH, ONG.  Informes y análisis sobre Derechos Humanos y Conflicto.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('82', 'B115', 'Pronunciamientos de la comunidad internacional, y de agencias de cooperación sobre el conflicto.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('83', 'B116', 'Grupos guerrilleros: FARC-EP, UC-ELN, EPL', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('84', 'B117', 'Paramilitares y grupos de Autodefensa.  Nuevos grupos paramilitares, Bacrim.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('85', 'B118', 'Acciones del conflicto armado: masacres, paro armado, secuestros, tráfico de armas, amenazas, reclutamiento forzado, allanamientos, confinamiento. Capturas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('86', 'B119', 'Impunidad: defensores de DDHH.  Desaparecidos. Informes.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('87', 'B1110', 'Acciones Bélicas: Combates, hostigamientos, voladura de torres, etc.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('89', 'B121', 'Registraduría.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('90', 'B122', 'Consejo Nacional Electoral.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('91', 'B123', 'Legislación electoral.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('92', 'B124', 'Revocatoria del mandato. Anulación.  Inhabilidades.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('93', 'B125', 'Comicios, elecciones gobernadores y alcaldes, reelección.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('94', 'B126', 'Campañas y candidaturas presidenciales, reelección.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('95', 'B127', 'Fraudes electorales, trasteo de votos, trashumancia de votos, otros delitos electorales. Informes MOE.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('96', 'B128', 'Candidatos campañas regionales, consejo, asamblea, congreso.  Parlamento andino.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('97', 'B129', 'Escrutinios, resultados electorales.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('98', 'B1210', 'Abstención.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('100', 'B131', 'Política Social, informes sobre calidad de vida, desarrollo y pobreza, aportes parafiscales. Cajas de compensación familiar.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('101', 'B132', 'Pensiones y cesantías.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('102', 'B133', 'Política de salud, ISS, Hospitales, POS, EPS, ARS, Sisbén. Compensar, Cajanal.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('103', 'B134', 'ICBF, DABS. Hogares comunitarios.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('106', 'C11', 'Dirección Nacional de Estupefacientes.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('107', 'C12', 'Política antidrogas, antinarcóticos, fumigación, certificación, interdicción, extinción de dominio. Informes. Plan Colombia.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('108', 'C13', 'Narcotraficantes, extradición, testaferrato, enriquecimiento ilícito.  Capturas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('109', 'C14', 'Lavado de dinero y/o activos. Decomiso de dinero.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('110', 'C15', 'Impacto en la economía nacional.  Impacto social.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('111', 'C16', 'Producción y tráfico de narcóticos.  Laboratorios.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('112', 'C17', 'Incautación, decomiso de narcóticos.  ', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('115', 'DA11', 'Indígenas', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('116', 'DA12', 'Negritudes, raizales.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('117', 'DA13', 'Gitanos', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('119', 'D21', 'Pronunciamientos de los sindicatos y de la OIT. Procesos de organización de trabajadores y pensionados.  ', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('120', 'D22', 'Paros y huelgas de trabajadores.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('121', 'D23', 'Cese de actividades, jornadas de protesta.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('122', 'D24', 'Condiciones de trabajo: DDHH, legislación, reformas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('123', 'D25', 'Empleo y salarios. Remesas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('124', 'D26', 'Relaciones empresa-trabajadores, ley 50 del 1990, despido de trabajadores, riesgos laborales, reintegros, licencias.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('125', 'D27', 'Empresas: Concordatos, ley 550 intervención económica. Multinacionales.  Zonas francas. Sistema financiero.  Dolarización, PYMES, Cooperativas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('126', 'D28', 'Convención colectiva, pliego de peticiones, concertación, tribunal de arbitramento.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('128', 'D31', 'Política urbana, legislación, espacio público. Tránsito. Bomberos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('129', 'D32', 'INURBE, IDU, valorización. Ejidos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('130', 'D33', 'Procesos de legalización, urbanizadores.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('131', 'D34', 'Usos del suelo, cerramientos, zonas de riesgo. Patrimonio cultural.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('132', 'D35', 'Poblamiento, invasiones, asentamientos subnormales, desalojos, reubicación, habitantes de la calle. Desplazamiento intraurbano.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('133', 'D36', 'Urbanismo, dinámica de los barrios, estratificación.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('134', 'D37', 'Vivienda, inquilinatos, usuarios, sistemas de crédito, subsidios, curadurías.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('135', 'D38', 'Seguridad ciudadana, milicias urbanas, bandas y pandillas, pactos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('137', 'D41', 'Acueducto y Alcantarillado. Tratamiento de aguas', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('138', 'D42', 'Energía. Electrificadoras. Empresas de servicios, gas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('139', 'D43', 'Medios de comunicación. Televisión.  Emisoras comunitarias. Canales locales de T.V., Internet. Periódicos.  Mincomunicaciones.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('140', 'D44', 'Teléfonos. Edatel. Endesa', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('141', 'D45', 'Basuras, aseo, reciclaje. Escombreras.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('142', 'D46', 'Tarifas, subsidios, superintendencia de servicios públicos, comisión reguladora de servicios. Desconectados.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('144', 'D51', 'Organizaciones populares urbanas, usuarios de servicios, redes.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('145', 'D52', 'Protestas cívicas urbanas y populares.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('146', 'D53', 'Paros cívicos, desobediencia civil.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('147', 'D54', 'Tomas, bloqueos, disturbios, asonadas', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('148', 'D55', 'Marchas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('149', 'D56', 'Mecanismos de participación y conciliación, acciones populares, jueces de paz, derechos de petición, acción de cumplimiento', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('150', 'D57', 'Cabildos, consulta popular, referendos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('152', 'D61', 'Política agraria, Reforma agraria.Situación del agro. Pronunciamiento Congreso Agrario. Minagricultura.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('153', 'D62', 'Legislación agraria.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('154', 'D63', 'Programas para el campo, PLANTE Sustitución de cultivos de uso ilícito, transgénicos. Agro Ingreso Seguro.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('155', 'D64', 'Instituciones: INCORA, ICA, UMATA, DRI, IICA, INCODER.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('156', 'D65', 'Sector agroindustrial. Biocombustibles.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('157', 'D66', 'FINAGRO. Banco Nacional Agrario.  Fiduagrario.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('158', 'D67', 'Créditos agrícolas, Caja Agraria, Fondo Agropecuario de garantías. Vivienda rural. Seguros.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('159', 'D68', 'Titulación de tierras, reservas campesinas. Baldíos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('160', 'D69', 'Problemas rurales, colonización.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('161', 'D610', 'Problemas con los cultivos, producción.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('163', 'D71', 'Éxodos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('164', 'D72', 'Desplazados, refugiados, confinados', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('165', 'D73', 'Protestas campesinas, paros.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('166', 'D74', 'Tomas, bloqueos, asonadas, disturbios.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('167', 'D75', 'Marchas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('168', 'D76', 'Organizaciones campesinas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('170', 'D81', 'Situación social de hombres y mujeres. Violencia intrafamiliar. Trata de personas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('171', 'D82', 'Políticas sobre la mujer. Derechos sexuales y reproductivos.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('172', 'D83', 'Protestas de mujeres.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('173', 'D84', 'Acciones y protestas Gays, LGBT ', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('174', 'D85', 'Organizaciones de mujeres.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('175', 'D86', 'Niñas y niños, jóvenes: Derechos, Ley de la infancia, ley de juventud. Hinchas- Barras bravas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('177', 'D91', 'Políticas sobre gremios.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('178', 'D92', 'Tomas, bloqueos, saboteos. Jornadas de   protesta.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('179', 'D93', 'Marchas.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('180', 'D94', 'Paros, desobediencia civil.  ', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('181', 'D95', 'Organizaciones de gremios.  Trabajadores independientes.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('183', 'D101', 'Política educativa. Legislación.  Universidades, colegios, escuelas.  Coldeportes. Colciencias. Política cultural, Mincultura. Bibliotecas. Sena.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('184', 'D102', 'Movilización estudiantil: Primaria, secundaria y universitaria, amenazas, DDHH.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('185', 'D103', 'Padres de familia. Protestas', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('186', 'D11', 'Conflictos Globales                ', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('187', 'D111', 'Políticas de orden global que inciden en la política y conflictos nacionales.  protestas globales contra el orden internacional,', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('188', 'D112', 'Conflictos fronterizos, migración.  América Latina.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('191', 'E11', 'Política ambiental, instituciones ambientales, prevención de desastres, licencias ambientales. Minambiente.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('192', 'E12', 'Legislación ambiental. Ley de fronteras, de páramos, ley del agua', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('193', 'E13', 'Reconstrucción por causa de desastres naturales, reubicación. Ley Quimbaya, ley Páez.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('195', 'E21', 'Desastres naturales, amenazas  geológicas, atentados ecológicos, desechos tóxicos', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('196', 'E22', 'Otros fenómenos naturales, contaminación, erosión, explotaciones mineras. Tráfico de fauna y flora.  Maltrato animal. Crímenes ambientales.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('197', 'E23', 'Biodiversidad, bosques naturales, reservas naturales y humedales.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('199', 'E31', 'Organizaciones en defensa del medio ambiente.', '2015-05-11', '2015-05-11');
INSERT INTO sal7711_gen_categoriaprensa (id, codigo, nombre, fechacreacion, created_at) VALUES ('200', 'E32', 'Protestas en defensa del medio ambiente.', '2015-05-11', '2015-05-11');
    SQL
  end

  def down
    drop_table :sal7711_gen_categoriaprensa
  end
end
