# frozen_string_literal: true

module SQL::JoinRow
  def chapter_row(quran_id, chapter_id, chapter)
    [
      chapter_id, chapter.number, chapter.name,
      chapter.tr_name, chapter.slug, chapter.city,
      quran_id
    ].map { Integer === _1 ? _1 : SQL::Utils.escape(_1) }
     .join(",")
  end

  def verse_row(verse, quran_id, chapter_id)
    [
      verse.number, quran_id,
      chapter_id, verse.content
    ].map { Integer === _1 ? _1 : SQL::Utils.escape(_1) }
     .join(",")
  end
end