// File: server/lib/src/services/jobs/meta_sync_job.dart

import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../catalog/meta_catalog_service.dart';
import '../dependency_injection.dart';

class MetaSyncJob extends FutureCall<EmptyModel>{
  @override
  Future<void> invoke(Session session, EmptyModel? object) async{
  // Get products with pending sync
    final pending = await Product.db.find(
      session,
      where: (t) => t.metaSyncStatus.equals('pending') &
                   t.cdnUploadStatus.equals('completed'),
      limit: 50,
    );
    
    final metaService = getIt<MetaCatalogService>();
    
    for (var product in pending) {
      await metaService.pushProduct(session, product);
      await Future.delayed(Duration(milliseconds: 500)); // Rate limiting
    }
  }
}