from django.core.management.base import BaseCommand
from maps.models import Document
from sorl.thumbnail.shortcuts import get_thumbnail

import logging
logger = logging.getLogger(__name__)

from maps.engine import engine

class Command(BaseCommand):

    help = 'Create or update thumbnails'
    
    def add_arguments(self, parser):
        parser.add_argument('geom',help='sorl geometry')
        parser.add_argument('--doc','-d', help='document')
        
    def handle(self, *args, **options):
        geom = options.get('geom')
        pk = options.get('doc')
        docs = Document.objects.all()
        if pk:
            docs = docs.filter(pk=pk)
        for doc in docs:
            if doc.doc:
                with engine(doc.doc.name):
                    logger.info('Processing document %s', doc)
                    im=get_thumbnail(doc.doc, geom)
                    if im is None:
                        logger.error('failed')
