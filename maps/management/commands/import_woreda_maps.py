from django.core.management.base import BaseCommand
from maps.models import Document, DocumentGroup
import os
import glob
import re
import logging
from maps.views import CLUSTERS
from django.core.files.base import ContentFile
logger = logging.getLogger(__name__)

#folder = '/home/theo/data/dissimination/woreda-suitability'
class Command(BaseCommand):

    help = 'Import woreda suitability maps'
    
    def add_arguments(self, parser):
        parser.add_argument('folder',help='folder with maps')
        
    def handle(self, *args, **options):
        folder = options.get('folder')
        logger.info(f'Importing from {folder}')
        pattern = re.compile(r'.*/cluster\d_(.*)\.png',)
        maps = DocumentGroup.objects.get(name__iexact='Woreda Suitability Maps')
        for nr in range(1,9):
            cluster = CLUSTERS[str(nr)]
            for filename in glob.glob(f'{folder}/cluster{nr}*.png'):
                logger.debug(filename)
                match = pattern.match(filename)
                if match:
                    woreda = match.group(1)
                    logger.debug(f'{cluster} - {woreda}')
                    group, created = maps.children.get_or_create(name=cluster)
                    if created:
                        logger.debug(f'Created group {group}')
                    with open(filename,'rb') as f:
                        content = f.read()
                        doc_file = ContentFile(content,os.path.basename(filename))
                    doc, created = group.document_set.get_or_create(name=woreda,defaults = {
                        'cluster': nr,
                        'description': f'Suitability map of woreda {woreda}',
                        'url': 'https://cloud.acaciadata.com',
                        'doc': doc_file
                        })
                    if created:
                        logger.debug(f'Created document {doc}')
                    