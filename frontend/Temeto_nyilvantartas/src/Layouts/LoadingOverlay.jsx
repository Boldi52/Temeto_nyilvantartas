export default function LoadingOverlay({ loading = false }) {
  if (!loading) return null;

  return (
    <div className="loading-overlay" aria-live="polite" aria-busy="true">
      <div className="spinner" role="status" aria-label="Betöltés" />
    </div>
  );
};