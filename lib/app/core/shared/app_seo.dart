// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:codewave_systems/app/core/shared/controller/app_texts.dart';
import 'package:meta_seo/meta_seo.dart';

class AppSeo {
  //SingleTon
  AppSeo._();
  static final AppSeo _instance = AppSeo._();
  factory AppSeo() => AppSeo._instance;
  //

  static Future init() async {
    //  if(kIsWeb) {
    // Define MetaSEO object
    MetaSEO meta = MetaSEO();
    // add meta seo open graph tags as you want
    meta.author(author: 'CodeWave Systems');
    meta.description(description: 'CodeWave Systems Website');
    meta.charset(charset: 'UFT-8');
    meta.keywords(keywords: <String>[...AppTexts.allTexts, ...others].toString().replaceAll('[', '').replaceAll(']', ''));

    // here you can add any tags does not exist in the package as this
    meta.nameContent(name: 'instagram:site', content: '@cw.systems');
  }
}

var others = [
  'desenvolvimento de software',
  'desenvolvimento de aplicativos',
  'desenvolvimento web',
  'soluções de software',
  'fábrica de software',
  'consultoria em TI',
  'design de interface de usuário',
  'aplicativos móveis',
  'suporte de software',
  'tecnologia da informação',
  'transformação digital',
  'inovação tecnológica',
  'qualidade de software',
  'experiência do usuário',
  'processos organizados',
  'melhores práticas',
  'equipe dedicada',
  'compromisso com a excelência',
  'atendimento ao cliente',
  'satisfação do cliente',
  'parceria colaborativa',
  'soluções personalizadas',
  'tecnologias de ponta',
  'suporte contínuo',
  'sucesso empresarial',
  'desenvolvimento ágil',
  'estratégias digitais',
  'melhores ferramentas',
  'excelência em desenvolvimento',
  'transformação de negócios',
  'segurança de software',
  'análise de requisitos',
  'entrega de software',
  'experiência em TI',
  'qualidade garantida',
  'soluções escaláveis',
  'inovação em software',
  'Flutter',
  'Dart',
  'PHP',
  'Laravel',
  'Node.js',
  'TypeScript',
  'Desenvolvimento Flutter',
  'Desenvolvimento Dart',
  'Desenvolvimento PHP',
  'Desenvolvimento Laravel',
  'Desenvolvimento Node.js',
  'Desenvolvimento TypeScript',
  'Aplicativos Flutter',
  'Websites PHP',
  'Aplicativos Web Node.js',
  'Desenvolvimento Ágil Flutter',
  'Desenvolvimento Ágil PHP',
  'Desenvolvimento Web Laravel',
  'Desenvolvimento Mobile Flutter',
  'Desenvolvimento Backend Node.js',
  'Desenvolvimento Frontend TypeScript',
  'Framework Flutter',
  'Framework Laravel',
  'Framework Node.js',
  'Framework TypeScript',
  'Desenvolvimento de software para Windows',
  'Desenvolvimento de software para Web',
  'Desenvolvimento de aplicativos Android',
  'Desenvolvimento de aplicativos iOS',
  'Desenvolvimento de software para Linux',
  'Desenvolvimento de software para macOS',
  'Softwares sob demanda',
  'Desenvolvimento de aplicativos sob demanda',
  'Desenvolvimento de sistemas sob demanda',
  'Projetos personalizados de software',
  'Soluções sob medida',
  'Desenvolvimento multiplataforma',
  'Desenvolvimento para múltiplos dispositivos',
  'Aplicativos personalizados',
  'Sistemas personalizados',
  'CodeWave Systems',
  'CodeWave',
  'Sistemas CodeWave',
  'Desenvolvimento CodeWave',
  'CodeWave Solutions',
  'CodeWave Tech',
  'CodeWave Development',
  'CodeWave Software',
  'CodeWave TI',
  'CodeWave Consultoria',
  'CodeWave Tecnologia',
  'CodeWave Inovação',
  'CodeWave Labs',
  'CodeWave Studio',
  'CodeWave Digital',
  'CodeWave Services',
  'CodeWave Solutions',
  'CodeWave Creations',
  'CodeWave Group',
];
