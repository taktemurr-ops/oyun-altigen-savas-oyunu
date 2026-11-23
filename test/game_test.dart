import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_altigen_savas_oyunu/oyun_altigen_savas_oyunu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(altigenSavasConfig.title.length, 33);
    expect(altigenSavasConfig.tagline.length, 33);
    for (final s in altigenSavasConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(altigenSavasConfig.gameId, altigenSavasId);
    expect(altigenSavasRules.gameId, altigenSavasId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(altigenSavasRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: altigenSavasId, optionalMechanics: altigenSavasRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(altigenSavasRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
